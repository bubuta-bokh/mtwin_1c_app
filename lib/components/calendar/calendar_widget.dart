import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';

Widget calendarWidget(
  BuildContext ctx,
  List<DateTime?> dialogCalendarPickerValue,
) {
  const dayTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  final weekendTextStyle = TextStyle(
    color: Colors.grey[500],
    fontWeight: FontWeight.w600,
  );
  final anniversaryTextStyle = TextStyle(
    color: Colors.red[400],
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
  final config = CalendarDatePicker2WithActionButtonsConfig(
    calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
    dayTextStyle: dayTextStyle,
    calendarType: CalendarDatePicker2Type.range,
    selectedDayHighlightColor: Colors.purple[800],
    closeDialogOnCancelTapped: true,
    firstDayOfWeek: 1,
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    centerAlignModePicker: true,
    customModePickerIcon: const SizedBox(),
    selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
    dayTextStylePredicate: ({required date}) {
      TextStyle? textStyle;
      if (date.weekday == DateTime.saturday ||
          date.weekday == DateTime.sunday) {
        textStyle = weekendTextStyle;
      }
      if (DateUtils.isSameDay(date, DateTime(2024, 12, 2))) {
        textStyle = anniversaryTextStyle;
      }
      return textStyle;
    },
    dayBuilder: ({
      required date,
      textStyle,
      decoration,
      isSelected,
      isDisabled,
      isToday,
    }) {
      Widget? dayWidget;
      if (date.day % 3 == 0 && date.day % 9 != 0) {
        dayWidget = Container(
          decoration: decoration,
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text(
                  MaterialLocalizations.of(ctx).formatDecimal(date.day),
                  style: textStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27.5),
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          isSelected == true ? Colors.white : Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return dayWidget;
    },
    yearBuilder: ({
      required year,
      decoration,
      isCurrentYear,
      isDisabled,
      isSelected,
      textStyle,
    }) {
      return Center(
        child: Container(
          decoration: decoration,
          height: 36,
          width: 72,
          child: Center(
            child: Semantics(
              selected: isSelected,
              button: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(year.toString(), style: textStyle),
                  if (isCurrentYear == true)
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  final aState = ctx.watch<AuthenticationBloc>().state;
  return aState is AuthenticationGotAllTokens
      ? SizedBox(
        width: 225,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final values = await showCalendarDatePicker2Dialog(
                    context: ctx,
                    config: config,
                    dialogSize: const Size(375, 420),
                    borderRadius: BorderRadius.circular(10),
                    value: dialogCalendarPickerValue,
                    dialogBackgroundColor: Colors.white,
                  );
                  if (values != null) {
                    // ignore: avoid_print
                    print('pipa');
                    ctx.read<CalendarBloc>().add(
                      CalendarGotValuesEvent(
                        calendarValues: values,
                        datePickerType: config.calendarType,
                      ),
                    );
                    // setState(() {
                    //   _dialogCalendarPickerValue = values;
                    // });
                  }
                },
                child: const Text('Выбор диапазона дат'),
              ),
            ],
          ),
        ),
      )
      : const SizedBox.shrink();
}
