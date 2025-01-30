part of 'calendar_bloc.dart';

sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}

final class CalendarInitializedState extends CalendarState {}

final class CalendarHasReadableValuesState extends CalendarState {}

final class CalendarHasNotReadableValuesState extends CalendarState {}
