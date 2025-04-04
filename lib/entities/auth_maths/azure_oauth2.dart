import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:pkce/pkce.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:window_to_front/window_to_front.dart';
import 'dart:io';
import 'dart:convert';

import 'auth_credentials.dart';

class AzureOauth2 {
  HttpServer? _codeListenerServer;
  String _codeGraph = '';
  String _codeChallenge = '';
  String? _codeVerifier;

  ///final String? _htmlResponsePayload = null;

  Future<Map<String, dynamic>?> getGraphToken() async {
    try {
      final params = StringBuffer();
      params.write("response_type=code");
      params.write("&scope=${AuthCredentials.scopes['graph']}");
      params.write("&client_id=${AuthCredentials.clientId}");
      params.write("&redirect_uri=${AuthCredentials.redirectUri}");
      params.write("&state=${AuthCredentials.authState}");
      final pkcePair = PkcePair.generate();
      _codeVerifier = pkcePair.codeVerifier;
      _codeChallenge = pkcePair.codeChallenge;
      params.write("&code_challenge=$_codeChallenge");
      params.write("&code_challenge_method=S256");
      final Uri authUrl = Uri.parse(
        '${AuthCredentials.authorizationUrl}?${params.toString()}',
      );
      await _codeListenerServer?.close();
      _codeListenerServer = await HttpServer.bind(
        'localhost',
        AuthCredentials.localPort,
      );
      await _authorize(authUrl);
      Map<String, String>? responseQueryParameters =
          await _listenAuthorizationCode();
      if (responseQueryParameters != null &&
          responseQueryParameters.containsKey("code")) {
        _codeGraph = responseQueryParameters["code"]!;
        Map<String, String> tokenReqPayload = {
          'client_id': AuthCredentials.clientId,
          'redirect_uri': AuthCredentials.redirectUri,
          'scope': 'https://graph.microsoft.com/User.Read offline_access',
          'grant_type': 'authorization_code',
          'code': _codeGraph,
        };
        tokenReqPayload.putIfAbsent(
          "code_verifier",
          () => pkcePair.codeVerifier,
        );

        final response = await http.post(
          Uri.parse(AuthCredentials.tokenUrl),
          body: tokenReqPayload,
        );
        var simka = json.decode(response.body);
        Map<String, dynamic> toReturn = {
          'refreshToken': simka["refresh_token"] as String,
          'graphAccessToken': simka["access_token"] as String,
          'expiresIn': simka["expires_in"] as int,
        };
        return toReturn;
      } else {
        return null;
      }
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<Map<String, String>?> _listenAuthorizationCode() async {
    var request = await _codeListenerServer!.first;
    var params = request.uri.queryParameters;
    if (!request.uri.toString().startsWith(AuthCredentials.redirectUri) &&
        !params.containsKey("code")) {
      return null;
    }

    request.response.statusCode = 200;
    request.response.headers.set('content-type', 'text/html');

    // if (_htmlResponsePayload != null) {
    //   request.response.writeln(_htmlResponsePayload!);
    // } else {
    //   request.response.writeln(_htmlResponsePayload!);
    // }
    await request.response.close();
    await _codeListenerServer!.close();
    await WindowToFront.activate();
    _codeListenerServer = null;
    return params;
  }

  Future<void> _authorize(Uri authorizationUrl) async {
    if (await canLaunchUrl(authorizationUrl)) {
      await launchUrl(authorizationUrl);
    } else {
      throw Exception('Could not launch $authorizationUrl');
    }
  }

  Future<Map<String, dynamic>?> getUserCreds(String accessToken) async {
    final params = StringBuffer();
    params.write(AuthCredentials.graphUserEndpoint);
    final String pipa = params.toString();
    var url = Uri.parse(pipa);
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    final String res = response.body;
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      myLogger.e('Wrong status code $statusCode returned!');
      return null;
    } else {
      final Map<String, dynamic>? parsed = json.decode(res);
      return parsed!;
    }
  }

  Future<Map<String, dynamic>?> getMtwinToken(
    String scope,
    String refreshToken,
  ) async {
    Map<String, String> tokenReqPayload = {
      'client_id': AuthCredentials.clientId,
      'redirect_uri': AuthCredentials.redirectUri,
      'scope': scope,
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
    };
    tokenReqPayload.putIfAbsent("code_verifier", () => _codeVerifier!);

    final response = await http.post(
      Uri.parse(AuthCredentials.tokenUrl),
      body: tokenReqPayload,
    );
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      return null;
    } else {
      var simka = json.decode(response.body);
      Map<String, dynamic> toReturn = {
        'refreshToken': simka["refresh_token"] as String,
        'accessToken': simka["access_token"] as String,
        'expiresIn': simka["expires_in"] as int,
      };
      return toReturn;
    }
  }

  Future<void> doLogout() async {
    final Uri logoutUrl = Uri.parse(AuthCredentials.logoutUrl);

    //await _codeListenerServer?.close();
    //_codeListenerServer =
    //await HttpServer.bind('localhost', AuthCredentials.localPort);

    if (await canLaunchUrl(logoutUrl)) {
      await launchUrl(logoutUrl);
      await WindowToFront.activate();
    } else {
      throw Exception('Could not launch $logoutUrl');
    }
  }
}
