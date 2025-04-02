part of 'analytics_bloc.dart';

sealed class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();

  @override
  List<Object> get props => [];
}

class AnalyticsInitialEvent extends AnalyticsEvent {
  final String envi;
  final bool loadingStage;

  const AnalyticsInitialEvent({required this.envi, required this.loadingStage});
  @override
  List<Object> get props => [envi, loadingStage];
}

class AnalyticsResetToInitialEvent extends AnalyticsEvent {}

class AnalyticsRequestToFetchDataEvent extends AnalyticsEvent {
  final QueryType1C taskToRun;
  final String dateStart;
  final String dateEnd;

  const AnalyticsRequestToFetchDataEvent({
    required this.taskToRun,
    required this.dateStart,
    required this.dateEnd,
  });

  @override
  List<Object> get props => [taskToRun, dateStart, dateEnd];
}

class AnalyticsConfigReadyEvent extends AnalyticsEvent {
  final AppConfig config;

  const AnalyticsConfigReadyEvent({required this.config});

  @override
  List<Object> get props => [config];
}
