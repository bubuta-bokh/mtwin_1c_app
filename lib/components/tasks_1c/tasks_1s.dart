import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/components/tasks_1c/task_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget task1C(BuildContext ctx) {
  //final astate = ctx.watch<AuthenticationBloc>().state;
  final cstate = ctx.watch<CalendarBloc>().state;
  if (cstate is CalendarHasReadableValuesState) {
    return Column(
      children: [
        const SizedBox(height: 10),
        taskListItem(
          1,
          'Проценты по договорам, открытым до этого периода и действующим на конец периода',
          '(без частичного погашения)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          2,
          'Проценты по договорам в этом периоде - закрытым в этом периоде заемщиком',
          '(выкуп)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          3,
          'Проценты по договорам, открытым и закрытым день в день',
          '',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          4,
          'Проценты по договорам, открытым в этом периоде - и действующим (не закрытым) на конец периода',
          '',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          5,
          'Проценты по договорам, открытым в последний день периода - и действующим (не закрытым) на конец периода',
          '',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          6,
          'Проценты по договорам, открытым до этого периода и закрытым в этом периоде заемщиком',
          '(выкуп)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          7,
          'Проценты по договорам, открытым до этого периода и закрытым полной продажей залога (лота)',
          '',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          8,
          'Проценты по договорам, открытым до этого периода и закрытым',
          'частичной продажей вещей',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          9,
          'Проценты по договорам, открытым до этого периода и действующим на конец периода',
          'с частичной продажей вещей',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          10,
          'Проценты по договорам, открытым до этого периода и частично погашенным до этого периода',
          '(Сумма займа 0 на начале периода и долг только по процентам)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          11,
          'Проценты по договорам, открытым до этого периода и полностью погашенным до этого периода (? займа 0, %% 0) - и не закрытым на конец периода',
          '(на остатке вещь)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(12, 'Открытия', '', ctx),
        const Divider(color: Colors.black12),
        taskListItem(13, 'Закрытия полной продажей', '', ctx),
        const Divider(color: Colors.black12),
        taskListItem(14, 'Закрытия самим заёмщиком', '(выкуп)', ctx),
        const Divider(color: Colors.black12),
        taskListItem(
          15,
          'Продажи частичные',
          '(для закрытых в этом периоде)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          16,
          'Продажи частичные',
          '(для закрытых в этом периоде с убытком)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(
          17,
          'Продажи частичные',
          '(для не закрытых в этом периоде)',
          ctx,
        ),
        const Divider(color: Colors.black12),
        taskListItem(18, 'Открытия', '(однодневки)', ctx),
      ],
    );
  } else {
    return const SizedBox.shrink();
  }
}
