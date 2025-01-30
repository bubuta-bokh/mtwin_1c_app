import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'calendar_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final scrollController = ScrollController();
    TextEditingController dateStartCtrl = TextEditingController();
    TextEditingController dateEndCtrl = TextEditingController();
    final cstate = context.watch<CalendarBloc>().state;
    dateStartCtrl.text = 'pipa';
    dateEndCtrl.text = 'pupa';
    if (cstate is CalendarHasReadableValuesState) {
      dateStartCtrl.text = context.read<CalendarBloc>().startDate;
      dateEndCtrl.text = context.read<CalendarBloc>().endDate;
    }

    // if (cstate is CalendarInitializedState) {
    //   var dialogCalendarPickerValue =
    //       context.read<CalendarBloc>().dialogCalendarPickerValue;

    //   return Center(
    //     child: calendarWidget(context, dialogCalendarPickerValue),
    //   );
    // } else {
    //   return SizedBox.shrink();
    // }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (cstate is CalendarHasReadableValuesState)
            ? Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: dateStartCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Начало периода',
                        //border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: dateEndCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Конец периода',
                        //border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        (cstate is CalendarHasReadableValuesState ||
                cstate is CalendarInitializedState ||
                cstate is CalendarHasNotReadableValuesState)
            ? Container(
                child: calendarWidget(context,
                    context.read<CalendarBloc>().dialogCalendarPickerValue),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
