import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';

Color getAppBarForegroundColor(String envi) {
  if (envi == 'DEBUG') {
    return Colors.redAccent;
  } else if (envi == 'DEV') {
    return Colors.amber;
  } else if (envi == 'PROD') {
    return Colors.indigo;
  } else {
    return Colors.grey;
  }
}
