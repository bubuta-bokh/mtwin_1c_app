import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String currentEnvironment;
  final String analyticsDebugCtrl;
  final String analyticsDevCtrl;
  final String analyticsProdCtrl;

  final String ticketDebugCtrl;
  final String ticketDevCtrl;
  final String ticketProdCtrl;

  final String ticketObjectDebugCtrl;
  final String ticketObjectDevCtrl;
  final String ticketObjectProdCtrl;
  //final String stunnelPort;
  //final String certificateSerial;

  AppConfig({
    required this.currentEnvironment,
    required this.analyticsDebugCtrl,
    required this.analyticsDevCtrl,
    required this.analyticsProdCtrl,
    required this.ticketDebugCtrl,
    required this.ticketDevCtrl,
    required this.ticketProdCtrl,
    required this.ticketObjectDebugCtrl,
    required this.ticketObjectDevCtrl,
    required this.ticketObjectProdCtrl,
  });

  static Future<AppConfig> forEnvironment() async {
    // load the json file
    final contents = await rootBundle.loadString(
      'assets/config/config.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig(
      currentEnvironment: json['current_environment'],
      analyticsDebugCtrl: json['analytics']['base_url_debug'],
      analyticsDevCtrl: json['analytics']['base_url_dev'],
      analyticsProdCtrl: json['analytics']['base_url_prod'],
      ticketDebugCtrl: json['ticket']['base_url_debug'],
      ticketDevCtrl: json['ticket']['base_url_dev'],
      ticketProdCtrl: json['ticket']['base_url_prod'],
      ticketObjectDebugCtrl: json['ticket_object']['base_url_debug'],
      ticketObjectDevCtrl: json['ticket_object']['base_url_dev'],
      ticketObjectProdCtrl: json['ticket_object']['base_url_prod'],
    );
  }
}
