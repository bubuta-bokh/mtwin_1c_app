import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar_foreground_color.dart';
//import 'package:mtwin_1c_app/components/main_components/app_bar/popup_menu_button.dart';
import 'package:mtwin_1c_app/entities/user_credentials.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_foreground_color.dart';
import 'package:mtwin_1c_app/main_components/app_bar/popup_menu_button.dart';

AppBar appBarWithAllTokens(
  String envi,
  UserCredentials userCreds,
  BuildContext ctx,
) {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  return AppBar(
    backgroundColor: getAppBarForegroundColor(envi),
    title: Text(
      isProduction
          ? 'MTWIN - 1C ($envi, релиз)'
          : 'MTWIN - 1C ($envi, разработка)',
      style: const TextStyle(fontSize: 18),
    ),
    centerTitle: true,
    elevation: 15,
    toolbarHeight: 70,
    actions: <Widget>[
      IconButton(
        onPressed: () => ctx.go("/settingsedit"),
        icon: const Icon(Icons.settings),
        iconSize: 30,
        color: Colors.black54,
      ),
      const SizedBox(width: 20),
      MyPopupMenuButton(userCreds: userCreds),
      const SizedBox(width: 25),
    ],
  );
}
