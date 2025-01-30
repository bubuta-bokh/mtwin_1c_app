import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:mtwin_1c_app/components/calendar/calendar_main.dart';
import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar.dart';
import 'package:mtwin_1c_app/components/tasks_1c/execute_task_trailing_button.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';

class ExecuteTask extends StatelessWidget {
  const ExecuteTask({super.key, required this.taskId});

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    var taskList = context.read<RunInto1cBloc>().taskList;
    var thisTask = taskList
        .where((element) => element.id == int.parse(taskId!))
        .toList()
        .first;

    return Scaffold(
      appBar: MtWinAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                  '${thisTask.name} ${thisTask.comment}, строка № ${thisTask.id}',
                  style: const TextStyle(fontSize: 22, letterSpacing: 1.1)),
              const SizedBox(
                height: 50,
              ),
              ListTile(
                leading: const Text(
                  '1',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26),
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
              const SizedBox(
                height: 50,
              ),
              ListTile(
                leading: const Text(
                  '2',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26),
                ),
                title: const Text(
                  'Построение файла JSON.',
                  style: TextStyle(fontSize: 20, letterSpacing: 1.1),
                ),
                trailing: executeTaskTrailingButton(context, thisTask, 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
