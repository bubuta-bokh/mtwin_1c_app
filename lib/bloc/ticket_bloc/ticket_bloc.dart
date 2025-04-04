import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';
import 'package:mtwin_1c_app/entities/ticket/ticket_data_to_make_files.dart';
import 'package:mtwin_1c_app/repositories/ticket_repository.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketRepository ticketRepository;
  AppConfig? config;
  late List<TicketDataToMakeFiles> ticketDataToMakeFiles;
  late List<int> doneOps = [];
  late int stoneId;

  TicketBloc({required this.ticketRepository}) : super(TicketInitial()) {
    on<TicketInitialEvent>((event, emit) async {
      try {
        if (!event.loadingStage) ticketRepository.prepareDio(event.envi);
        ticketDataToMakeFiles = [];
      } on Exception catch (e, _) {
        SnackbarGlobal.show(
          '${e.toString()}. Не удалось настроить приложение для работы с бэк-эндом ломбарда.',
          15,
          'error',
        );
      }
    });

    on<TicketConfigReadyEvent>((event, emit) async {
      try {
        config = event.config;
      } on Exception catch (e, _) {
        SnackbarGlobal.show(
          '${e.toString()}. Не удалось загрузить конфигурацию приложения.',
          15,
          'error',
        );
      }
    });

    on<TicketResetEvent>((event, emit) async {
      ticketDataToMakeFiles = [];
      emit(TicketInitial());
    });

    on<TicketRebuildFinanceEvent>((event, emit) async {
      emit(TicketRequestToRebuildFinanceState());
      var result = await ticketRepository.rebuildFinance(
        event.dateStart,
        event.dateEnd,
      );
      if (!result) {
        emit(TicketRebuildFinanceFailedState());
      } else {
        emit(TicketRebuildFinanceSuccessState());
      }
    });

    on<TicketSoldEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketSoldEventFinanceRebuildRequestState());
      try {
        await ticketRepository.rebuildFinanceWithTicketSoldEvent(
          event.dateStart,
          event.dateEnd,
        );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketSoldEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(
          TicketSoldEventFinanceRebuildFailedState(
            exceptionString: 'Что-то пошло не так: $e',
          ),
        );
      }
    });

    on<TicketSoldByPartsEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketSoldByPartsEventFinanceRebuildRequestState());
      try {
        await ticketRepository.rebuildFinanceWithTicketSoldByPartsEvent(
          event.dateStart,
          event.dateEnd,
        );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketSoldByPartsEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketSoldByPartsEventFinanceRebuildFailedState());
      }
    });

    on<TicketPayoutEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketPayoutEventFinanceRebuildRequestState());
      try {
        await ticketRepository.rebuildFinanceWithTicketPayoutEvent(
          event.dateStart,
          event.dateEnd,
        );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketPayoutEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketPayoutEventFinanceRebuildFailedState());
      }
    });

    on<TicketCounterPayedOutEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketCounterPayedOutEventFinanceRebuildRequestState());
      try {
        await ticketRepository.rebuildFinanceWithTicketCounterPayedOutEvent(
          event.dateStart,
          event.dateEnd,
        );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketCounterPayedOutEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketCounterPayedOutEventFinanceRebuildFailedState());
      }
    });

    on<TicketInterestRepaymentEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketInterestRepaymentEventFinanceRebuildRequestState());
      try {
        await ticketRepository.rebuildFinanceWithTicketInterestRepaymentEvent(
          event.dateStart,
          event.dateEnd,
        );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketInterestRepaymentEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketInterestRepaymentEventFinanceRebuildFailedState());
      }
    });

    on<TicketLoanRepaymentEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketLoanRepaymentEventFinanceRebuildRequestState());
      try {
        await ticketRepository.rebuildFinanceWithTicketLoanRepaymentEvent(
          event.dateStart,
          event.dateEnd,
        );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketLoanRepaymentEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketLoanRepaymentEventFinanceRebuildFailedState());
      }
    });

    on<TicketCounterInterestRepaymentEventFinanceRebuildEvent>((
      event,
      emit,
    ) async {
      emit(TicketCounterInterestRepaymentEventFinanceRebuildRequestState());
      try {
        await ticketRepository
            .rebuildFinanceWithTicketCounterInterestRepaymentEvent(
              event.dateStart,
              event.dateEnd,
            );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketCounterInterestRepaymentEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketCounterInterestRepaymentEventFinanceRebuildFailedState());
      }
    });

    on<TicketCounterLoanRepaymentEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketCounterLoanRepaymentEventFinanceRebuildRequestState());
      try {
        await ticketRepository
            .rebuildFinanceWithTicketCounterLoanRepaymentEvent(
              event.dateStart,
              event.dateEnd,
            );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketCounterLoanRepaymentEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketCounterLoanRepaymentEventFinanceRebuildFailedState());
      }
    });

    on<TicketCounterSoldByPartsEventFinanceRebuildEvent>((event, emit) async {
      emit(TicketCounterSoldByPartsEventFinanceRebuildRequestState());
      try {
        await ticketRepository.rebuildFinanceWithTicketCounterSoldByPartsEvent(
          event.dateStart,
          event.dateEnd,
        );
        if (!doneOps.contains(event.opNo)) {
          doneOps.add(event.opNo);
        }
        emit(TicketCounterSoldByPartsEventFinanceRebuildSuccessState());
      } on Exception catch (e, _) {
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(TicketCounterSoldByPartsEventFinanceRebuildFailedState());
      }
    });
  }
}
