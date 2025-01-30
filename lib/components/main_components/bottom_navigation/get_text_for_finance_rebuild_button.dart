import 'package:flutter/material.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';

Text getTextForFinanceRebuildButton(TicketState tstate) {
  Text toReturn = const Text('Перезалить финансы за период');
  if (tstate is TicketRebuildFinanceSuccessState) {
    toReturn = const Text('Ошибок нет, льём ещё?');
  }
  if (tstate is TicketRebuildFinanceFailedState) {
    toReturn = const Text('Были ошибки!');
  }
  return toReturn;
}
