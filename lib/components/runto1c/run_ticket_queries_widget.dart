import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
//import 'package:mtwin_1c_app/components/main_components/circular_waiting_component/circular_waiting_component.dart';

Widget runTicketQueriesWidget(BuildContext ctx) {
  final astate = ctx.watch<AuthenticationBloc>().state;
  final cstate = ctx.watch<CalendarBloc>().state;
  final TicketState tstate = ctx.watch<TicketBloc>().state;
  final AnalyticsState ystate = ctx.watch<AnalyticsBloc>().state;
  int queriesCount = ctx.read<RunInto1cBloc>().queriesToRun.length;
  if (ystate is AnalyticsRequestToFetchDataRow14FailedState) {
    return Card(
      color: Colors.pink[200],
      elevation: 10,
      surfaceTintColor: Colors.greenAccent,
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ystate.errorMessage,
          style: const TextStyle(
              fontSize: 14, letterSpacing: 1.2, fontWeight: FontWeight.bold),
        ),
      ),
    );
  } else if (astate is AuthenticationGotAllTokens &&
      cstate is CalendarHasReadableValuesState &&
      queriesCount > 0 &&
      tstate is! TicketRequestToFetchDataStartedState &&
      tstate is! TicketRequestToFetchDataSuccededState) {
    return TextButton.icon(
      onPressed: () {
        // var taskToRun = ctx.read<RunInto1cBloc>().taskToRun;
        // var dateStart = ctx.read<CalendarBloc>().startDate;
        // var dateEnd = ctx.read<CalendarBloc>().endDate;
        // ctx.read<AnalyticsBloc>().add(AnalyticsRequestToFetchDataEvent(
        //     taskToRun: queriesToRun,
        //     dateStart: dateStart,
        //     dateEnd: dateEnd));
      },
      icon: Icon(Icons.play_circle_fill_rounded,
          size: 32.0, color: Colors.blue[800]),
      label: const Text('Получить данные от сервера',
          style: TextStyle(
              fontSize: 18,
              letterSpacing: 1.5,
              color: Color.fromARGB(255, 5, 44, 91))),
    );
  } else if (astate is AuthenticationGotAllTokens &&
      cstate is CalendarHasReadableValuesState &&
      queriesCount > 0 &&
      tstate is TicketRequestToFetchDataStartedState) {
    return const Text('Идёт загрузка данных с сервера...',
        style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.5,
            color:
                Color.fromARGB(255, 5, 44, 91))); //circularWaitingComponent();
  } else if (astate is AuthenticationGotAllTokens &&
      cstate is CalendarHasReadableValuesState &&
      queriesCount > 0 &&
      tstate is TicketRequestToFetchDataSuccededState) {
    return const Text(
      'Все данные успешно загружены.',
      style: TextStyle(letterSpacing: 1.5, fontSize: 18),
    );
  } else {
    return const SizedBox.shrink();
  }
}
