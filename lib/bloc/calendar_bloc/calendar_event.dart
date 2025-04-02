part of 'calendar_bloc.dart';

sealed class CalendarEvent extends Equatable {
  const CalendarEvent();
  @override
  List<Object> get props => [];
}

class CalendarInitialEvent extends CalendarEvent {}

class CalendarGotValuesEvent extends CalendarEvent {
  final CalendarDatePicker2Type datePickerType;
  final List<DateTime?> calendarValues;

  const CalendarGotValuesEvent(
      {required this.datePickerType, required this.calendarValues});

  @override
  List<Object> get props => [datePickerType, calendarValues];
}
