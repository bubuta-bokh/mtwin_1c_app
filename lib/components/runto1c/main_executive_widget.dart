// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mtwin_1c_app/bloc/calendar_bloc/calendar_bloc.dart';
// import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
// import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
// import 'package:mtwin_1c_app/components/runto1c/header_widget_1c.dart';

// List<Widget> mainExecutiveWidget(RunInto1cState run1cstate,
//     CalendarState cstate, BuildContext ctx, TicketState tstate) {
//   List<Widget> toReturn = [];
//   List<Widget> itemsToAdd = [];

//   toReturn.add(const SizedBox(height: 50));

//   if (ctx.read<RunInto1cBloc>().run1CParam == 1) {
//     if (run1cstate is RunInto1CGotParamState &&
//         cstate is CalendarHasReadableValuesState &&
//         tstate is! TicketRequestToFetchOpeningsStartedState &&
//         tstate is! TicketRequestToFetchOpeningsSuccededState) {
//       itemsToAdd = [
//         headerWidget1C(ctx.read<RunInto1cBloc>().run1CParam),
//         TextButton.icon(
//           onPressed: () {
//             ctx.read<TicketBloc>().add(const TicketRequestToFetchOpeningsEvent(
//                 param1C: 1, dateStart: '2024-11-01', dateEnd: '2024-11-30'));
//           },
//           icon: const Icon(Icons.play_arrow, size: 28.0, color: Colors.lime),
//           label: const Text('Запустить скрипт'),
//         ),
//       ];
//     } else if (tstate is TicketRequestToFetchOpeningsStartedState) {
//       itemsToAdd = [const CircularProgressIndicator()];
//     } else if (tstate is TicketRequestToFetchOpeningsSuccededState &&
//         run1cstate is! RunInto1COpeningsRanWithSuccessState &&
//         run1cstate is! RunInto1COpeningsRequestState) {
//       itemsToAdd = [
//         const SizedBox(height: 20),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Данные получены успешно. Записей за период:',
//                   style: TextStyle(fontSize: 16, letterSpacing: 1.4),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   tstate.listCount.toString(),
//                   style: const TextStyle(
//                       fontSize: 16,
//                       letterSpacing: 1.4,
//                       fontWeight: FontWeight.w600),
//                 )
//               ],
//             ),
//             TextButton.icon(
//               onPressed: () {
//                 ctx.read<RunInto1cBloc>().add(RunInto1CDoOpeningsEvent(
//                     ticketOpenings: ctx.read<TicketBloc>().ticketOpeningsList));
//               },
//               icon:
//                   const Icon(Icons.play_arrow, size: 28.0, color: Colors.lime),
//               label: const Text('Создать файл'),
//             ),
//           ],
//         ),
//       ];
//     } else if (run1cstate is RunInto1COpeningsRequestState) {
//       itemsToAdd = [const CircularProgressIndicator()];
//     } else if (run1cstate is RunInto1COpeningsRanWithSuccessState) {
//       itemsToAdd = [const Text('Файл с открытиями сформирован и записан.')];
//     } else {
//       itemsToAdd = [];
//     }

//     toReturn.addAll(itemsToAdd);
//   }

//   return toReturn;
// }
