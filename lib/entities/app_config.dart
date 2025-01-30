import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String currentEnvironment;
  //final String stunnelPort;
  //final String certificateSerial;

  AppConfig({
    required this.currentEnvironment,
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
      //stunnelPort: json['stunnel_port'],
      //certificateSerial: json['certificate_serial']
    );
  }
}
