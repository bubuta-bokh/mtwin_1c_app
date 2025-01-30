import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:mtwin_1c_app/components/calendar/calendar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';
import 'package:mtwin_1c_app/components/runto1c/header_widget_1c.dart';
import 'package:mtwin_1c_app/components/runto1c/main_executive_widget.dart';
import 'package:mtwin_1c_app/components/runto1c/run1c_select_widget.dart';
import 'package:mtwin_1c_app/components/runto1c/run_file_create_widget.dart';
import 'package:mtwin_1c_app/components/runto1c/run_ticket_queries_widget.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class RunTo1CScreen extends StatelessWidget {
  const RunTo1CScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final run1cstate = context.watch<RunInto1cBloc>().state;
      final cstate = context.watch<CalendarBloc>().state;
      final tstate = context.watch<TicketBloc>().state;

      final items = context
          .read<RunInto1cBloc>()
          .taskList
          .map((animal) => MultiSelectItem<QueryType1C>(animal, animal.name))
          .toList();
      final multiSelectKey = GlobalKey<FormFieldState>();
      List<QueryType1C> selectedQuery1 = [];
      List<MultiSelectItem<QueryType1C>> selectedQuery5 = items;

      return SingleChildScrollView(
          child: Container(
              width: 680,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(1),
              child: Column(children: <Widget>[
                const SizedBox(height: 20),
                run1CSelectWidget(items, context),
                const SizedBox(height: 20),
                runTicketQueriesWidget(context),
                const SizedBox(height: 20),
                runFileCreateWidget(context),
              ])));
    });
  }
}
