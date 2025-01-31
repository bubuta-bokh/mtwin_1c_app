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
          var row14Data = ctx.read<AnalyticsBloc>().row14Data;
          ctx.read<RunInto1cBloc>().add(RunInto1CDoRow14ReportsEvent(
              row14: row14Data!,
              queryName:
                  '[${currentTask.id}] ${currentTask.name} ${currentTask.comment}'));
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
