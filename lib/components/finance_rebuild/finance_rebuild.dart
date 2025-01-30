import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/components/calendar/calendar_main.dart';
import 'package:mtwin_1c_app/components/finance_rebuild/finance_rebuild_list_item.dart';
import 'package:mtwin_1c_app/components/tasks_1c/task_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
//import 'package:mtwin_1c_app/components/tasks_1c/task_list_item_button.dart';

Widget financeRebuild(BuildContext ctx) {
  //final astate = ctx.watch<AuthenticationBloc>().state;
  final cstate = ctx.watch<CalendarBloc>().state;
  if (cstate is CalendarHasReadableValuesState) {
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      financeRebuildListItem(
          1, 'Ломбард. Продажа ЗБ целиком', 'TicketSoldEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(
          2, 'Ломбард. Продажа ЗБ по частям', 'TicketSoldByPartsEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(3, 'Ломбард. Выдача займа по договору',
          'TicketPayedOutWithCashboxEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(4, 'Ломбард. Отмена выдачи займа по договору',
          'TicketCounterPayedOutWithCashboxEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(5, 'Ломбард. Возврат процентов',
          'TicketInterestRepaymentWithCashboxEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(6, 'Ломбард. Отмена продажи ЗБ по частям',
          'TicketCounterSoldByPartsEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(7, 'Ломбард. Отмена возврата процентов',
          'CounterTicketInterestRepaymentWithCashboxEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(8, 'Ломбард. Отмена возврата ссуды',
          'CounterTicketLoanRepaymentWithCashboxEvent', ctx),
      const Divider(color: Colors.black12),
      financeRebuildListItem(9, 'Ломбард. Возврат ссуды',
          'TicketLoanRepaymentWithCashboxEvent', ctx),
    ]);
  } else {
    return const SizedBox.shrink();
  }
}
