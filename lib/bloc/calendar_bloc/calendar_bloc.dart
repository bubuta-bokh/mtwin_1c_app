import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  late List<DateTime?> dialogCalendarPickerValue = [];
  late String calendarDisplayString;
  late String startDate;
  late String endDate;

  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarInitialEvent>((event, emit) {
      dialogCalendarPickerValue = [];
      var dtNow = DateTime.now();
      var dateEndNextDay = DateTime(dtNow.year, dtNow.month, 1);
      var dateEnd = dateEndNextDay.subtract(const Duration(days: 1));
      var dateStart = DateTime(dateEnd.year, dateEnd.month, 1);
      dialogCalendarPickerValue.add(dateStart);
      dialogCalendarPickerValue.add(dateEnd);
      emit(CalendarInitializedState());
    });

    on<CalendarGotValuesEvent>((event, emit) {
      DateFormat dateFormat = DateFormat("dd.MM.yyyy");
      var values = event.calendarValues
          .map((e) => e != null ? DateUtils.dateOnly(e) : null)
          .toList();
      String? valueText = (values.isNotEmpty ? values[0] : null)
          .toString()
          .replaceAll('00:00:00.000', '');
      if (values.isNotEmpty) {
        //startDate = values[0].toString().replaceAll('00:00:00.000', '');
        startDate = dateFormat.format(values[0]!);
        endDate = values.length > 1 ? dateFormat.format(values[1]!) : 'null';
        calendarDisplayString = 'от $startDate по $endDate';
        emit(CalendarHasReadableValuesState());
      } else {
        calendarDisplayString = '';
        startDate = '';
        endDate = '';
        emit(CalendarHasNotReadableValuesState());
      }
    });
  }
}
