part of 'runinto1c_bloc.dart';

sealed class RunInto1cState extends Equatable {
  const RunInto1cState();

  @override
  List<Object> get props => [];
}

final class RunInto1cInitial extends RunInto1cState {}

final class RunInto1CGotQueriesState extends RunInto1cState {}

final class RunInto1CInitializedState extends RunInto1cState {
  final List<QueryType1C> queryTypes;

  const RunInto1CInitializedState({required this.queryTypes});

  @override
  List<Object> get props => [queryTypes];
}

final class RunInto1CMakeFilesRanWithSuccessState extends RunInto1cState {}

final class RunInto1CMakeFilesRanAndFailedState extends RunInto1cState {}

final class RunInto1CMakeFilesRequestState extends RunInto1cState {}
