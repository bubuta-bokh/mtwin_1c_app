import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';

Widget runFileCreateWidget(BuildContext ctx) {
  final astate = ctx.watch<AuthenticationBloc>().state;
  final runstate = ctx.watch<RunInto1cBloc>().state;
  final tstate = ctx.watch<TicketBloc>().state;

  if (astate is AuthenticationGotAllTokens &&
      tstate is TicketRequestToFetchDataSuccededState &&
      runstate is! RunInto1CMakeFilesRequestState &&
      runstate is! RunInto1CMakeFilesRanAndFailedState &&
      runstate is! RunInto1CMakeFilesRanWithSuccessState) {
    return TextButton.icon(
      onPressed: () {
        ctx.read<RunInto1cBloc>().add(RunInto1CDoReportsEvent(
            ticketDataToMakeFiles:
                ctx.read<TicketBloc>().ticketDataToMakeFiles));
      },
      icon: const Icon(Icons.play_arrow, size: 28.0, color: Colors.lime),
      label: const Text('Создать файлы из полученных данных'),
    );
  } else if (astate is AuthenticationGotAllTokens &&
      tstate is TicketRequestToFetchDataSuccededState &&
      runstate is RunInto1CMakeFilesRequestState &&
      runstate is! RunInto1CMakeFilesRanAndFailedState &&
      runstate is! RunInto1CMakeFilesRanWithSuccessState) {
    return Text('создаём файлы...',
        style: TextStyle(
            color: Colors.green[800], fontSize: 16, letterSpacing: 1.5));
  } else if (astate is AuthenticationGotAllTokens &&
      tstate is TicketRequestToFetchDataSuccededState &&
      runstate is! RunInto1CMakeFilesRequestState &&
      runstate is RunInto1CMakeFilesRanAndFailedState &&
      runstate is! RunInto1CMakeFilesRanWithSuccessState) {
    return Text('файлы создать не удалось',
        style: TextStyle(
            color: Colors.red[800], fontSize: 16, letterSpacing: 1.5));
  } else if (astate is AuthenticationGotAllTokens &&
      tstate is TicketRequestToFetchDataSuccededState &&
      runstate is! RunInto1CMakeFilesRequestState &&
      runstate is! RunInto1CMakeFilesRanAndFailedState &&
      runstate is RunInto1CMakeFilesRanWithSuccessState) {
    return Text('файлы успешно созданы!',
        style: TextStyle(
            color: Colors.blue[800], fontSize: 20, letterSpacing: 1.5));
  } else {
    return const SizedBox.shrink();
  }
}
