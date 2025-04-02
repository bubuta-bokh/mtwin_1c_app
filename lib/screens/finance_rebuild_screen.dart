import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/components/calendar/calendar_main.dart';
import 'package:mtwin_1c_app/components/finance_rebuild/finance_rebuild.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_new.dart';
import 'package:mtwin_1c_app/main_components/drawer/mtwin_drawer.dart';

class FinanceRebuildScreen extends StatelessWidget {
  const FinanceRebuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MtWin - 1C'),
      drawer: const MtWinDrawer(),
      body: Container(
        padding: const EdgeInsets.all(7),
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [const CalendarScreen(), financeRebuild(context)],
          ),
        ),
      ),
    );
  }
}
