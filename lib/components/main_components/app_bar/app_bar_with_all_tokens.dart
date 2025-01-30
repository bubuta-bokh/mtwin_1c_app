import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar_foreground_color.dart';
import 'package:mtwin_1c_app/components/main_components/app_bar/popup_menu_button.dart';
import 'package:mtwin_1c_app/entities/user_credentials.dart';

AppBar appBarWithAllTokens(String envi, UserCredentials userCreds) {
  return AppBar(
    backgroundColor: getAppBarForegroundColor(envi),
    title: Text(
      'MTWIN - 1C ($envi)',
      style: const TextStyle(fontSize: 18),
    ),
    centerTitle: true,
    elevation: 15,
    toolbarHeight: 70,
    actions: <Widget>[
      MyPopupMenuButton(userCreds: userCreds),
      const SizedBox(
        width: 25,
      )
    ],
  );
}
