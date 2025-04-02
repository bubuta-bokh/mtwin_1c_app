import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
//import 'package:mtwin_1c_app/components/circular_waiting_component.dart';

Widget leadingItem(BuildContext ctx, int ordNum) {
  final tState = ctx.watch<TicketBloc>().state;
  var doneOps = ctx.watch<TicketBloc>().doneOps;
  var ordNumIsDone = doneOps.contains(ordNum);
  if (ordNumIsDone) {
    return const Icon(
      Icons.check,
      color: Colors.green,
      size: 35,
    );
  } else {
    if (ordNum == 1) {
      if (tState is TicketSoldEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState is TicketSoldEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState is TicketSoldEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 2) {
      if (tState is TicketSoldByPartsEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState is TicketSoldByPartsEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState is TicketSoldByPartsEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 3) {
      if (tState is TicketPayoutEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState is TicketPayoutEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState is TicketPayoutEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 4) {
      if (tState is TicketCounterPayedOutEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState
          is TicketCounterPayedOutEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState
          is TicketCounterPayedOutEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 5) {
      if (tState is TicketInterestRepaymentEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState
          is TicketInterestRepaymentEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState
          is TicketInterestRepaymentEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 9) {
      if (tState is TicketLoanRepaymentEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState is TicketLoanRepaymentEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState is TicketLoanRepaymentEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 7) {
      if (tState
          is TicketCounterInterestRepaymentEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState
          is TicketCounterInterestRepaymentEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState
          is TicketCounterInterestRepaymentEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 8) {
      if (tState is TicketCounterLoanRepaymentEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState
          is TicketCounterLoanRepaymentEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState
          is TicketCounterLoanRepaymentEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else if (ordNum == 6) {
      if (tState is TicketCounterSoldByPartsEventFinanceRebuildRequestState) {
        return const SizedBox(
            height: 35, width: 35, child: CircularProgressIndicator());
      } else if (tState
          is TicketCounterSoldByPartsEventFinanceRebuildSuccessState) {
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        );
      } else if (tState
          is TicketCounterSoldByPartsEventFinanceRebuildFailedState) {
        return const Icon(
          Icons.stop_circle_sharp,
          color: Colors.red,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.question_mark_rounded,
          color: Colors.black12,
        );
      }
    } else {
      return const Icon(
        Icons.question_mark_rounded,
        color: Colors.black12,
      );
    }
  }
}
