import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar.dart';
import 'package:mtwin_1c_app/components/main_components/bottom_navigation/bottom_navigation.dart';
import 'package:mtwin_1c_app/components/main_components/drawer/mtwin_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:mtwin_1c_app/components/calendar/calendar_main.dart';
//import 'package:mtwin_1c_app/components/runto1c/runto1c_screen.dart';
//import 'package:mtwin_1c_app/components/tasks_1c/tasks_1s.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final astate = context.watch<AuthenticationBloc>().state;
    return Scaffold(
      appBar: MtWinAppBar(),
      drawer: const MtWinDrawer(),
      body: Center(
        child: Text(astate is! AuthenticationGotAllTokens
            ? 'вы не авторизованы'
            : 'выбор действия в боковом меню'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
