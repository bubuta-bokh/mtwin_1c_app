import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';

Widget executeTaskTrailingButton(
    BuildContext ctx, QueryType1C currentTask, int step) {
  var astate = ctx.watch<AnalyticsBloc>().state;
  var rstate = ctx.watch<RunInto1cBloc>().state;
  myLogger.i('astate=$astate and rstate=$rstate');
  if (step == 1) {
    if (astate is AnalyticsRequestToFetchDataStartedState) {
      return const SizedBox(
        width: 35,
        height: 35,
        child: (CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
        )),
      );
    } else if (astate is AnalyticsRequestToFetchDataSuccededState) {
      return const Icon(
        Icons.check,
        color: Colors.green,
        size: 35,
      );
    } else if (astate is AnalyticsRequestToFetchDataFailedState) {
      return const Icon(
        Icons.stop_circle_sharp,
        color: Colors.red,
        size: 35,
      );
    } else {
      return IconButton(
        onPressed: () {
          ctx.read<AnalyticsBloc>().add(AnalyticsRequestToFetchDataEvent(
              taskToRun: currentTask,
              dateStart: ctx.read<CalendarBloc>().startDate,
              dateEnd: ctx.read<CalendarBloc>().endDate));
        },
        icon: const Icon(Icons.play_arrow_rounded),
        iconSize: 30,
        color: Colors.black45,
      );
    }
  } else {
    if (astate is AnalyticsInitial ||
        astate is AnalyticsRequestToFetchDataStartedState) {
      return const Icon(
        Icons.question_mark_rounded,
        color: Colors.black12,
        size: 30,
      );
    } else if (astate is AnalyticsRequestToFetchDataSuccededState &&
        rstate is RunInto1CInitializedState) {
      return IconButton(
        onPressed: () {
          switch (astate.taskId) {
            case 14:
              var row14Data = ctx.read<AnalyticsBloc>().row14Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow14ReportsEvent(
                  row14: row14Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 12:
              var row12Data = ctx.read<AnalyticsBloc>().row1218Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow12ReportsEvent(
                  row12: row12Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 18:
              var row18Data = ctx.read<AnalyticsBloc>().row1218Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow18ReportsEvent(
                  row18: row18Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 1:
              var row1Data = ctx.read<AnalyticsBloc>().row1Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow1ReportsEvent(
                  row1: row1Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 2:
              var row2Data = ctx.read<AnalyticsBloc>().row2Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow2ReportsEvent(
                  row2: row2Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 4:
              var row4Data = ctx.read<AnalyticsBloc>().row4Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow4ReportsEvent(
                  row4: row4Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 7:
              var row7Data = ctx.read<AnalyticsBloc>().row7Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow7ReportsEvent(
                  row7: row7Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 8:
              var row8Data = ctx.read<AnalyticsBloc>().row8Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow8ReportsEvent(
                  row8: row8Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 9:
              var row9Data = ctx.read<AnalyticsBloc>().row9Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow9ReportsEvent(
                  row9: row9Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 13:
              var row13Data = ctx.read<AnalyticsBloc>().row13Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow13ReportsEvent(
                  row13: row13Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 16:
              var row16Data = ctx.read<AnalyticsBloc>().row16Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow16ReportsEvent(
                  row16: row16Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 15:
              var row15Data = ctx.read<AnalyticsBloc>().row15Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow15ReportsEvent(
                  row15: row15Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
            case 17:
              var row17Data = ctx.read<AnalyticsBloc>().row17Data;
              ctx.read<RunInto1cBloc>().add(RunInto1CDoRow17ReportsEvent(
                  row17: row17Data!,
                  queryName:
                      '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
              break;
          }
        },
        icon: const Icon(Icons.play_arrow_rounded),
        iconSize: 30,
        color: Colors.black45,
      );
    } else if (astate is AnalyticsRequestToFetchDataSuccededState &&
        rstate is RunInto1CMakeFilesRanWithSuccessState) {
      return const Icon(
        Icons.check,
        color: Colors.green,
        size: 35,
      );
    } else {
      return const Icon(
        Icons.stop_circle_sharp,
        color: Colors.red,
        size: 35,
      );
    }
  }
}
