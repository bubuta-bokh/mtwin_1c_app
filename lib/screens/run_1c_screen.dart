import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/components/calendar/calendar_main.dart';
import 'package:mtwin_1c_app/components/tasks_1c/tasks_1s.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_new.dart';
import 'package:mtwin_1c_app/main_components/drawer/mtwin_drawer.dart';

class Run1cScreen extends StatelessWidget {
  const Run1cScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MtWin - 1C'),
      drawer: const MtWinDrawer(),
      body: Container(
        //width: 700,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [const CalendarScreen(), task1C(context)],
          ),
        ),
      ),
      //bottomNavigationBar: const BottomNavigation(),
    );
  }
}
