class AuthCredentials {
  static const clientId = '5533d7be-14f6-4274-b59d-2fafe4b85854';
  static const tenantId = '9a4813dd-fc07-4da9-a318-13010878873d';
  static const graphUserEndpoint = 'https://graph.microsoft.com/v1.0/me';
  static const servicePrefix = 'https://www.mtwin.ru/MtWin.Services.';
  static const localPort = 9085;
  static const redirectUri = 'http://localhost:9085/auth/';
  static const authState = '9a4813dd-fc07-4da9-a318-13010878873d';
  static const authorizationUrl =
      'https://login.microsoftonline.com/$tenantId/oauth2/v2.0/authorize';
  static const logoutUrl =
      'https://login.microsoftonline.com/$tenantId/oauth2/logout';
  static const tokenUrl =
      'https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token';
  static const Map<String, String> scopes = {
    'graph': 'https://graph.microsoft.com/User.Read',
    'company': '${servicePrefix}CompanyService/user_impersonation',
    'ticket': '${servicePrefix}TicketService/user_impersonation',
    'analytics': '${servicePrefix}AnalyticsService/user_impersonation',
    'customer': '${servicePrefix}CustomerService/user_impersonation',
  };
}
