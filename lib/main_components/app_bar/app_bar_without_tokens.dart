import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
//import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar_foreground_color.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_foreground_color.dart';

AppBar appBarWithoutTokens(String envi, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: getAppBarForegroundColor(envi),
    title: const Text('MTWIN - 1C (ожидание авторизации)'),
    centerTitle: true,
    elevation: 15,
    toolbarHeight: 70,
    actions: <Widget>[
      IconButton(
        onPressed:
            () => {
              context.read<AuthenticationBloc>().add(LoginButtonPressed()),
            },
        icon: const Icon(Icons.person_outlined),
        iconSize: 40,
      ),
      const SizedBox(width: 25),
    ],
  );
}
