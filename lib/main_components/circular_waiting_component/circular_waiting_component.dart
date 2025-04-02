import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_new.dart';
////import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar.dart';

Widget circularWaitingComponent() {
  return Scaffold(
    appBar: CustomAppBar(title: 'MtWin - 1C'),
    body: const Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: (CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
        )),
      ),
    ),
  );
}
