import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';

Widget executeTaskTrailingButton(
    BuildContext ctx, QueryType1C currentTask, int step) {
  var astate = ctx.watch<AnalyticsBloc>().state;
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
    return const Text('przepis');
  }
}
