import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtwin_1c_app/components/tasks_1c/execute_task_trailing_button.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_new.dart';
//import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';

class ExecuteTask extends StatelessWidget {
  const ExecuteTask({super.key, required this.taskId});

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    var taskList = context.read<RunInto1cBloc>().taskList;
    var thisTask =
        taskList
            .where((element) => element.id == int.parse(taskId!))
            .toList()
            .first;

    return Scaffold(
      appBar: CustomAppBar(title: 'MtWin - 1C'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                '${thisTask.name} ${thisTask.comment}, строка № ${thisTask.id}',
                style: const TextStyle(fontSize: 22, letterSpacing: 1.1),
              ),
              const SizedBox(height: 50),
              ListTile(
                leading: const Text(
                  '1',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                  ),
                ),
                title: const Text(
                  'Получение данных от сервера для построения файла JSON.',
                  style: TextStyle(fontSize: 20, letterSpacing: 1.1),
                ),
                trailing: executeTaskTrailingButton(context, thisTask, 1),
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.play_arrow_rounded),
                //   iconSize: 30,
                //   color: Colors.black45,
                // ),
              ),
              const SizedBox(height: 50),
              ListTile(
                leading: const Text(
                  '2',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                  ),
                ),
                title: const Text(
                  'Построение файла JSON.',
                  style: TextStyle(fontSize: 20, letterSpacing: 1.1),
                ),
                trailing: executeTaskTrailingButton(context, thisTask, 2),
              ),
              const SizedBox(height: 50),
              ListTile(
                leading: const Text(
                  '3',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                  ),
                ),
                title: const Text(
                  'К списку задач',
                  style: TextStyle(fontSize: 22, letterSpacing: 1.3),
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.read<AnalyticsBloc>().add(
                      AnalyticsResetToInitialEvent(),
                    );
                    context.read<RunInto1cBloc>().add(RunInto1CInitialEvent());
                    context.read<CalendarBloc>().add(CalendarInitialEvent());
                    context.go("/run1ctasks");
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                  iconSize: 30,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
