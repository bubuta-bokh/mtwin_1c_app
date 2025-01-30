import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mtwin_1c_app/entities/auth_maths/azure_oauth2.dart';
import 'package:mtwin_1c_app/entities/user_credentials.dart';
//import 'package:logger/logger.dart';

//import './auth_credentials.dart';

class AuthRepository {
  late FlutterSecureStorage storage;
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
    'company': null,
    'ticket': null,
    'analytics': null,
    'customer': null
  };

  bool get hasUserCreds {
    return (userCreds != null);
  }

  AuthRepository() {
    storage = const FlutterSecureStorage();
    azure = AzureOauth2();

    //tokenStuff = TokenStuff();
  }

  Future<Map<String, dynamic>?> getGraphTokens() async {
    //logger.i('Inside getGraphTokens');
    var graphInfo = await azure.getGraphToken();
    //logger.i('graphInfo=$graphInfo');
    if (graphInfo != null && graphInfo.isNotEmpty) {
      _graphAccessToken = graphInfo["graphAccessToken"];
      _refreshToken = graphInfo["refreshToken"];
      //_fillTokenStruct('graph', graphInfo);
    }
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
          surname: userCredsInfo["surname"]);
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

  doLogout() async {
    await azure.doLogout();
  }
}
