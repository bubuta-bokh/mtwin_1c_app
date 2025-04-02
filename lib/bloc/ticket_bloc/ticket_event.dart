part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class TicketInitialEvent extends TicketEvent {
  final String envi;
  final bool loadingStage;

  const TicketInitialEvent({required this.envi, required this.loadingStage});
  @override
  List<Object> get props => [envi];
}

class TicketResetEvent extends TicketEvent {}

class TicketRequestToFetchDataEvent extends TicketEvent {
  final List<QueryType1C> queriesToRun;
  final String dateStart;
  final String dateEnd;

  const TicketRequestToFetchDataEvent({
    required this.queriesToRun,
    required this.dateStart,
    required this.dateEnd,
  });

  @override
  List<Object> get props => [queriesToRun, dateStart, dateEnd];
}

class TicketRebuildFinanceEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;

  const TicketRebuildFinanceEvent({
    required this.dateStart,
    required this.dateEnd,
  });

  @override
  List<Object> get props => [dateStart, dateEnd];
}

class TicketSoldEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketSoldEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketSoldByPartsEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketSoldByPartsEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketConfigReadyEvent extends TicketEvent {
  final AppConfig config;

  const TicketConfigReadyEvent({required this.config});

  @override
  List<Object> get props => [config];
}

class TicketPayoutEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketPayoutEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketCounterPayedOutEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketCounterPayedOutEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketInterestRepaymentEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketInterestRepaymentEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketLoanRepaymentEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketLoanRepaymentEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketCounterInterestRepaymentEventFinanceRebuildEvent
    extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketCounterInterestRepaymentEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketCounterLoanRepaymentEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketCounterLoanRepaymentEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}

class TicketCounterSoldByPartsEventFinanceRebuildEvent extends TicketEvent {
  final String dateStart;
  final String dateEnd;
  final int opNo;

  const TicketCounterSoldByPartsEventFinanceRebuildEvent({
    required this.dateStart,
    required this.dateEnd,
    required this.opNo,
  });

  @override
  List<Object> get props => [dateStart, dateEnd, opNo];
}
