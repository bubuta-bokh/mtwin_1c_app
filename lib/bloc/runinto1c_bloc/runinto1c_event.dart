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

class RunInto1CDoRow14ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow14> row14;
  final String queryName;

  const RunInto1CDoRow14ReportsEvent(
      {required this.row14, required this.queryName});

  @override
  List<Object> get props => [row14, queryName];
}

class RunInto1CDoRow2ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow2> row2;
  final String queryName;

  const RunInto1CDoRow2ReportsEvent(
      {required this.row2, required this.queryName});

  @override
  List<Object> get props => [row2, queryName];
}

class RunInto1CDoRow16ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow16> row16;
  final String queryName;

  const RunInto1CDoRow16ReportsEvent(
      {required this.row16, required this.queryName});

  @override
  List<Object> get props => [row16, queryName];
}

class RunInto1CDoRow13ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow13> row13;
  final String queryName;

  const RunInto1CDoRow13ReportsEvent(
      {required this.row13, required this.queryName});

  @override
  List<Object> get props => [row13, queryName];
}

class RunInto1CDoRow7ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow7> row7;
  final String queryName;

  const RunInto1CDoRow7ReportsEvent(
      {required this.row7, required this.queryName});

  @override
  List<Object> get props => [row7, queryName];
}

class RunInto1CDoRow8ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow8> row8;
  final String queryName;

  const RunInto1CDoRow8ReportsEvent(
      {required this.row8, required this.queryName});

  @override
  List<Object> get props => [row8, queryName];
}

class RunInto1CDoRow9ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow9> row9;
  final String queryName;

  const RunInto1CDoRow9ReportsEvent(
      {required this.row9, required this.queryName});

  @override
  List<Object> get props => [row9, queryName];
}

class RunInto1CDoRow1ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow1> row1;
  final String queryName;

  const RunInto1CDoRow1ReportsEvent(
      {required this.row1, required this.queryName});

  @override
  List<Object> get props => [row1, queryName];
}

class RunInto1CDoRow4ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow4> row4;
  final String queryName;

  const RunInto1CDoRow4ReportsEvent(
      {required this.row4, required this.queryName});

  @override
  List<Object> get props => [row4, queryName];
}

class RunInto1CDoRow15ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow15> row15;
  final String queryName;

  const RunInto1CDoRow15ReportsEvent(
      {required this.row15, required this.queryName});

  @override
  List<Object> get props => [row15, queryName];
}

class RunInto1CDoRow17ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow17> row17;
  final String queryName;

  const RunInto1CDoRow17ReportsEvent(
      {required this.row17, required this.queryName});

  @override
  List<Object> get props => [row17, queryName];
}

class RunInto1CDoRow12ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow1218> row12;
  final String queryName;

  const RunInto1CDoRow12ReportsEvent(
      {required this.row12, required this.queryName});

  @override
  List<Object> get props => [row12, queryName];
}

class RunInto1CDoRow18ReportsEvent extends RunInto1cEvent {
  final List<AnalyticsRow1218> row18;
  final String queryName;

  const RunInto1CDoRow18ReportsEvent(
      {required this.row18, required this.queryName});

  @override
  List<Object> get props => [row18, queryName];
}
