import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:mtwin_1c_app/components/finance_rebuild/leading_item.dart';

Widget financeRebuildListItem(
    int itemNumber, String itemName, String itemComment, BuildContext ctx) {
  return ListTile(
    leading: leadingItem(ctx, itemNumber),
    title: Text(itemName),
    subtitle: Text(itemComment),
    trailing: IconButton(
      onPressed: () {
        switch (itemNumber) {
          case 1:
            ctx.read<TicketBloc>().add(TicketSoldEventFinanceRebuildEvent(
                dateStart: ctx.read<CalendarBloc>().startDate,
                dateEnd: ctx.read<CalendarBloc>().endDate,
                opNo: itemNumber));
            break;
          case 2:
            ctx.read<TicketBloc>().add(
                TicketSoldByPartsEventFinanceRebuildEvent(
                    dateStart: ctx.read<CalendarBloc>().startDate,
                    dateEnd: ctx.read<CalendarBloc>().endDate,
                    opNo: itemNumber));
            break;
          case 3:
            ctx.read<TicketBloc>().add(TicketPayoutEventFinanceRebuildEvent(
                dateStart: ctx.read<CalendarBloc>().startDate,
                dateEnd: ctx.read<CalendarBloc>().endDate,
                opNo: itemNumber));
            break;
          case 4:
            ctx.read<TicketBloc>().add(
                TicketCounterPayedOutEventFinanceRebuildEvent(
                    dateStart: ctx.read<CalendarBloc>().startDate,
                    dateEnd: ctx.read<CalendarBloc>().endDate,
                    opNo: itemNumber));
            break;
          case 5:
            ctx.read<TicketBloc>().add(
                TicketInterestRepaymentEventFinanceRebuildEvent(
                    dateStart: ctx.read<CalendarBloc>().startDate,
                    dateEnd: ctx.read<CalendarBloc>().endDate,
                    opNo: itemNumber));
            break;
          case 6:
            ctx.read<TicketBloc>().add(
                TicketCounterSoldByPartsEventFinanceRebuildEvent(
                    dateStart: ctx.read<CalendarBloc>().startDate,
                    dateEnd: ctx.read<CalendarBloc>().endDate,
                    opNo: itemNumber));
            break;
          case 7:
            ctx.read<TicketBloc>().add(
                TicketCounterInterestRepaymentEventFinanceRebuildEvent(
                    dateStart: ctx.read<CalendarBloc>().startDate,
                    dateEnd: ctx.read<CalendarBloc>().endDate,
                    opNo: itemNumber));
            break;
          case 8:
            ctx.read<TicketBloc>().add(
                TicketCounterLoanRepaymentEventFinanceRebuildEvent(
                    dateStart: ctx.read<CalendarBloc>().startDate,
                    dateEnd: ctx.read<CalendarBloc>().endDate,
                    opNo: itemNumber));
            break;
          case 9:
            ctx.read<TicketBloc>().add(
                TicketLoanRepaymentEventFinanceRebuildEvent(
                    dateStart: ctx.read<CalendarBloc>().startDate,
                    dateEnd: ctx.read<CalendarBloc>().endDate,
                    opNo: itemNumber));
            break;
        }
      },
      icon: const Icon(Icons.play_arrow_rounded),
      iconSize: 30,
      color: Colors.black45,
    ),
  );
}
