import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
////import 'package:mtwin_1c_app/components/circular_waiting_component.dart';
////import 'package:mtwin_1c_app/components/main_components/bottom_navigation/get_text_for_finance_rebuild_button.dart';
import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:mtwin_1c_app/main_components/circular_waiting_component/circular_waiting_component.dart';
import '../../../bloc/auth_bloc/auth_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final cstate = context.watch<CalendarBloc>().state;
    final astate = context.watch<AuthenticationBloc>().state;
    final tstate = context.watch<TicketBloc>().state;

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        myLogger.i(
          'authState is $astate and calendar state is $cstate and ticket state is $tstate',
        );
        if (astate is AuthenticationGotAllTokens &&
            cstate is CalendarHasReadableValuesState &&
            tstate is! TicketRequestToRebuildFinanceState) {
          return (BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 18.0,
              color: Colors.blueGrey[50],
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // TextButton.icon(
                  //     onPressed: () {
                  //       var dateStart = context.read<CalendarBloc>().startDate;
                  //       var dateEnd = context.read<CalendarBloc>().endDate;
                  //       context.read<TicketBloc>().add(
                  //           TicketRebuildFinanceEvent(
                  //               dateStart: dateStart, dateEnd: dateEnd));
                  //     },
                  //     icon:
                  //         const Icon(Icons.settings_backup_restore, size: 28.0),
                  //     label: getTextForFinanceRebuildButton(
                  //         tstate)
                  //     ),
                ],
              ),
            ),
          ));
        } else if (astate is AuthenticationGotAllTokens &&
            cstate is CalendarHasReadableValuesState &&
            tstate is TicketRequestToRebuildFinanceState) {
          return circularWaitingComponent();
        } else {
          return const SizedBox(width: 1);
        }
      },
    );
  }
}
