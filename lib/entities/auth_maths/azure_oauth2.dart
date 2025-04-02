import 'package:dio/dio.dart';
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
  final String? _htmlResponsePayload = null;

  Future<Map<String, dynamic>?> getGraphToken() async {
    try {
      print('[From azure_oath2] L18');
      final params = StringBuffer();
      print('[From azure_oath2] L20');
      params.write("response_type=code");
      params.write("&scope=${AuthCredentials.scopes['graph']}");
      params.write("&client_id=${AuthCredentials.clientId}");
      params.write("&redirect_uri=${AuthCredentials.redirectUri}");
      params.write("&state=${AuthCredentials.authState}");
      print('[From azure_oath2] L26');
      final pkcePair = PkcePair.generate();
      print('[From azure_oath2] L28');
      _codeVerifier = pkcePair.codeVerifier;
      print('[From azure_oath2] L30');
      _codeChallenge = pkcePair.codeChallenge;
      print('[From azure_oath2] L32');
      params.write("&code_challenge=$_codeChallenge");
      params.write("&code_challenge_method=S256");
      print('[From azure_oath2] L35');
      final Uri authUrl = Uri.parse(
        '${AuthCredentials.authorizationUrl}?${params.toString()}',
      );
      //print('[From azure_oath2] L38');
      await _codeListenerServer?.close();
      //print('[From azure_oath2] L40');
      _codeListenerServer = await HttpServer.bind(
        'localhost',
        AuthCredentials.localPort,
      );
      //print('[From azure_oath2] L43');
      await _authorize(authUrl);
      //print('[From azure_oath2] L45');
      Map<String, String>? responseQueryParameters =
          await _listenAuthorizationCode();
      //print('[From azure_oath2] L48');
      if (responseQueryParameters != null &&
          responseQueryParameters.containsKey("code")) {
        //print('[From azure_oath2] L51');
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
        print('[From azure_oath2] L61');

        final response = await http.post(
          Uri.parse(AuthCredentials.tokenUrl),
          body: tokenReqPayload,
        );
        // Dio dio = Dio();
        // final response =
        //     await dio.post(AuthCredentials.tokenUrl, data: tokenReqPayload);
        //myLogger.i(response);
        var simka = json.decode(response.body);
        print('[From azure_oath2] L65');
        Map<String, dynamic> toReturn = {
          'refreshToken': simka["refresh_token"] as String,
          'graphAccessToken': simka["access_token"] as String,
          'expiresIn': simka["expires_in"] as int,
        };
        print('[From azure_oath2] L71');
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
    //print("url=${params.toString()}");
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
      print('bad!');
      return null;
    } else {
      final Map<String, dynamic>? parsed = json.decode(res);
      //UserCredentials userCreds = UserCredentials();
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

  // Future<Map<String, String>> _fetchAccessToken() async {
  //   Map<String, String> tokenReqPayload = {
  //     'client_id': AuthCredentials.clientId,
  //     'redirect_uri': AuthCredentials.redirectUri,
  //     'grant_type': 'authorization_code',
  //     'code': _codeGraph
  //   };

  //   if (_codeVerifier != null) {
  //     tokenReqPayload.putIfAbsent("code_verifier", () => _codeVerifier!);
  //   }

  //   final response = await http.post(Uri.parse(AuthCredentials.tokenUrl),
  //       body: tokenReqPayload);
  //   var simka = json.decode(response.body);
  //   _tokenStuff["code"] = code;
  //   if ((simka["scope"] as String)
  //       .contains("https://graph.microsoft.com/User.Read")) {
  //     _tokenStuff["graph"] = simka["access_token"] as String;
  //   }

  //   return _tokenStuff;
  // }
}
