part of 'runinto1c_bloc.dart';

sealed class RunInto1cEvent extends Equatable {
  const RunInto1cEvent();

  @override
  List<Object> get props => [];
}

class RunInto1CInitialEvent extends RunInto1cEvent {}

class Got1CRunQueryListEvent extends RunInto1cEvent {
  final List<QueryType1C> queriesToRun;

  const Got1CRunQueryListEvent({required this.queriesToRun});

  @override
  List<Object> get props => [queriesToRun];
}

class RunInto1CDoReportsEvent extends RunInto1cEvent {
  final List<TicketDataToMakeFiles> ticketDataToMakeFiles;

  const RunInto1CDoReportsEvent({required this.ticketDataToMakeFiles});

  @override
  List<Object> get props => [ticketDataToMakeFiles];
}
