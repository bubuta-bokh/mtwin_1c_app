part of 'analytics_bloc.dart';

sealed class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object> get props => [];
}

final class AnalyticsInitial extends AnalyticsState {}

final class AnalyticsRequestToFetchDataStartedState extends AnalyticsState {}

final class AnalyticsRequestToFetchDataSuccededState extends AnalyticsState {}

final class AnalyticsRequestToFetchDataFailedState extends AnalyticsState {}

final class AnalyticsRequestToFetchDataRow14SucceedState
    extends AnalyticsState {}

final class AnalyticsRequestToFetchDataRow14FailedState extends AnalyticsState {
  final String errorMessage;

  const AnalyticsRequestToFetchDataRow14FailedState(
      {required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
