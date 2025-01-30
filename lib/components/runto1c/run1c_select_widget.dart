import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:mtwin_1c_app/components/runto1c/header_widget_1c.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

Widget run1CSelectWidget(
    List<MultiSelectItem<QueryType1C>> itemsPassed, BuildContext ctx) {
  final astate = ctx.watch<AuthenticationBloc>().state;
  final cstate = ctx.watch<CalendarBloc>().state;
  Widget toReturn = (astate is AuthenticationGotAllTokens &&
          cstate is CalendarHasReadableValuesState)
      ? Column(
          children: [
            const SizedBox(
              height: 1,
            ),
            MultiSelectDialogField(
              items: itemsPassed,
              title: const Text("Все запросы"),
              selectedColor: Colors.blue,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              buttonIcon: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.blue,
              ),
              buttonText: Text(
                "Выбранные запросы",
                style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 16,
                ),
              ),
              onConfirm: (results) {
                if (results.isNotEmpty) {
                  ctx.read<TicketBloc>().add(TicketResetEvent());
                  ctx
                      .read<RunInto1cBloc>()
                      .add(Got1CRunQueryListEvent(queriesToRun: results));
                }
              },
            ),
          ],
        )
      : const SizedBox.shrink();

  return toReturn;
}
