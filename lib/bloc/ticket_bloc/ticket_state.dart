part of 'ticket_bloc.dart';

sealed class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

final class TicketInitial extends TicketState {}

final class TicketRequestToFetchDataSuccededState extends TicketState {
  //final int listCount;

  //const TicketRequestToFetchDataSuccededState({required this.listCount});

  //@override
  //List<Object> get props => [listCount];
}

final class TicketRequestToFetchDataFailedState extends TicketState {}

final class TicketRequestToFetchDataStartedState extends TicketState {}

final class TicketRequestToRebuildFinanceState extends TicketState {}

final class TicketRebuildFinanceSuccessState extends TicketState {}

final class TicketRebuildFinanceFailedState extends TicketState {}

final class TicketSoldEventFinanceRebuildRequestState extends TicketState {}

final class TicketSoldEventFinanceRebuildSuccessState extends TicketState {}

final class TicketSoldEventFinanceRebuildFailedState extends TicketState {
  final String exceptionString;
  const TicketSoldEventFinanceRebuildFailedState(
      {required this.exceptionString});
  @override
  List<Object> get props => [exceptionString];
}

final class TicketSoldByPartsEventFinanceRebuildRequestState
    extends TicketState {}

final class TicketSoldByPartsEventFinanceRebuildSuccessState
    extends TicketState {}

final class TicketSoldByPartsEventFinanceRebuildFailedState
    extends TicketState {}

final class TicketPayoutEventFinanceRebuildRequestState extends TicketState {}

final class TicketPayoutEventFinanceRebuildSuccessState extends TicketState {}

final class TicketPayoutEventFinanceRebuildFailedState extends TicketState {}

final class TicketCounterPayedOutEventFinanceRebuildRequestState
    extends TicketState {}

final class TicketCounterPayedOutEventFinanceRebuildSuccessState
    extends TicketState {}

final class TicketCounterPayedOutEventFinanceRebuildFailedState
    extends TicketState {}

final class TicketInterestRepaymentEventFinanceRebuildRequestState
    extends TicketState {}

final class TicketInterestRepaymentEventFinanceRebuildSuccessState
    extends TicketState {}

final class TicketInterestRepaymentEventFinanceRebuildFailedState
    extends TicketState {}

final class TicketLoanRepaymentEventFinanceRebuildRequestState
    extends TicketState {}

final class TicketLoanRepaymentEventFinanceRebuildSuccessState
    extends TicketState {}

final class TicketLoanRepaymentEventFinanceRebuildFailedState
    extends TicketState {}

final class TicketCounterInterestRepaymentEventFinanceRebuildRequestState
    extends TicketState {}

final class TicketCounterInterestRepaymentEventFinanceRebuildSuccessState
    extends TicketState {}

final class TicketCounterInterestRepaymentEventFinanceRebuildFailedState
    extends TicketState {}

final class TicketCounterLoanRepaymentEventFinanceRebuildRequestState
    extends TicketState {}

final class TicketCounterLoanRepaymentEventFinanceRebuildSuccessState
    extends TicketState {}

final class TicketCounterLoanRepaymentEventFinanceRebuildFailedState
    extends TicketState {}

final class TicketCounterSoldByPartsEventFinanceRebuildRequestState
    extends TicketState {}

final class TicketCounterSoldByPartsEventFinanceRebuildSuccessState
    extends TicketState {}

final class TicketCounterSoldByPartsEventFinanceRebuildFailedState
    extends TicketState {}
