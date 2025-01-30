part of 'analytics_bloc.dart';

sealed class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();

  @override
  List<Object> get props => [];
}

class AnalyticsInitialEvent extends AnalyticsEvent {
  final String envi;

  const AnalyticsInitialEvent({required this.envi});
  @override
  List<Object> get props => [envi];
}

class AnalyticsRequestToFetchDataEvent extends AnalyticsEvent {
  final QueryType1C taskToRun;
  final String dateStart;
  final String dateEnd;

  const AnalyticsRequestToFetchDataEvent(
      {required this.taskToRun,
      required this.dateStart,
      required this.dateEnd});

  @override
  List<Object> get props => [taskToRun, dateStart, dateEnd];
}
