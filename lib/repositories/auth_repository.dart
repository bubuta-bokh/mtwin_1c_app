//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
import 'package:mtwin_1c_app/entities/auth_maths/azure_oauth2.dart';
import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';
import 'package:mtwin_1c_app/entities/user_credentials.dart';
import 'dart:io';
import 'dart:convert';
//import 'package:logger/logger.dart';

//import './auth_credentials.dart';

class AuthRepository {
  //late FlutterSecureStorage storage;
  AppConfig? config;
  late AzureOauth2 azure;
  //late TokenStuff tokenStuff;
  String? _graphAccessToken;
  String? _refreshToken;
  // final Logger logger = Logger(
  //   printer: PrettyPrinter(),
  // );
  UserCredentials? userCreds;
  bool get hasToken {
    return (_refreshToken != null &&
        _refreshToken!.isNotEmpty &&
        _graphAccessToken != null &&
        _graphAccessToken!.isNotEmpty);
  }

  Map<String, Map<String, dynamic>?> tokenStuff = {
    'ticket': null,
    'analytics': null,
  };

  bool get hasUserCreds {
    return (userCreds != null);
  }

  void setAppConfig(AppConfig cfg) {
    config = cfg;
  }

  AuthRepository() {
    //storage = const FlutterSecureStorage();
    azure = AzureOauth2();

    //tokenStuff = TokenStuff();
  }

  Future<Map<String, dynamic>?> getGraphTokens() async {
    //logger.i('Inside getGraphTokens');
    print('[From authrepo] L53');

    var graphInfo = await azure.getGraphToken();

    print('[From authrepo] L55');
    //logger.i('graphInfo=$graphInfo');
    if (graphInfo != null && graphInfo.isNotEmpty) {
      print('[From authrepo] L58');
      _graphAccessToken = graphInfo["graphAccessToken"];
      print('[From authrepo] L60');
      _refreshToken = graphInfo["refreshToken"];
      print('[From authrepo] L62');
      //_fillTokenStruct('graph', graphInfo);
    }
    print('[From authrepo] L65');
    return graphInfo;
  }

  Future<UserCredentials?> getUserCredentials() async {
    //logger.i('Inside getUserCredentials token = $_graphAccessToken');
    var userCredsInfo = await azure.getUserCreds(_graphAccessToken!);
    //logger.i('user creds info=$userCredsInfo');
    if (userCredsInfo != null && userCredsInfo.isNotEmpty) {
      userCreds = UserCredentials(
        displayName: userCredsInfo["displayName"],
        givenName: userCredsInfo["givenName"],
        email: userCredsInfo["mail"],
        mobilePhone: '',
        office: userCredsInfo["officeLocation"],
        surname: userCredsInfo["surname"],
      );
    }
    //logger.i('user creds=$userCreds');
    return userCreds;
  }

  Future<void> getMtWinTokenStuff(scope) async {
    var tokenInfo = await azure.getMtwinToken(scope, _refreshToken!);
    if (scope.toString().contains('CompanyService')) {
      tokenStuff['company'] = tokenInfo;
    } else if (scope.toString().contains('TicketService')) {
      tokenStuff['ticket'] = tokenInfo;
    } else if (scope.toString().contains('AnalyticsService')) {
      tokenStuff['analytics'] = tokenInfo;
    } else if (scope.toString().contains('CustomerService')) {
      tokenStuff['customer'] = tokenInfo;
    }
  }

  Future<bool> updateConfigFile(AppConfig cfg, String envi) async {
    try {
      config = cfg;
      Map<String, dynamic> toReturn = {};
      toReturn['current_environment'] = envi;

      Map<String, dynamic> analytics = {};
      analytics['base_url_debug'] = cfg.analyticsDebugCtrl;
      analytics['base_url_dev'] = cfg.analyticsDevCtrl;
      analytics['base_url_prod'] = cfg.analyticsProdCtrl;
      toReturn['analytics'] = analytics;

      Map<String, dynamic> ticket = {};
      ticket['base_url_debug'] = cfg.ticketDebugCtrl;
      ticket['base_url_dev'] = cfg.ticketDevCtrl;
      ticket['base_url_prod'] = cfg.ticketProdCtrl;
      toReturn['ticket'] = ticket;

      Map<String, dynamic> ticketObject = {};
      ticketObject['base_url_debug'] = cfg.ticketObjectDebugCtrl;
      ticketObject['base_url_dev'] = cfg.ticketObjectDevCtrl;
      ticketObject['base_url_prod'] = cfg.ticketObjectProdCtrl;
      toReturn['ticket_object'] = ticketObject;

      var fileioresult = writeToFile(toReturn);
      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> writeToFile(Map<String, dynamic> jsonObj) async {
    try {
      Encoding pipa = utf8;
      //final String curpath = '${Directory.current.path}\\Data\\';
      File file = File("assets/config/config.json");
      await file.create(recursive: true);

      //final File file = File('Data/$fileName.json');

      file.writeAsStringSync(json.encode(jsonObj), encoding: pipa);
      return true;
    } on Exception catch (ex) {
      print(ex);
      return false;
    }
  }

  doLogout() async {
    await azure.doLogout();
  }
}
