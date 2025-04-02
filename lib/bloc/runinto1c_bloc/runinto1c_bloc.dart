import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_13.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_15.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_17.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row1218.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_1.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_14.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_16.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_2.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_4.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_7.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_8.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_9.dart';
import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';
import 'package:mtwin_1c_app/entities/ticket/ticket_data_to_make_files.dart';
import 'package:mtwin_1c_app/repositories/run1C_repository.dart';

part 'runinto1c_event.dart';
part 'runinto1c_state.dart';

class RunInto1cBloc extends Bloc<RunInto1cEvent, RunInto1cState> {
  //final Run1cRepository run1cRepository;
  late List<QueryType1C> queriesToRun = [];
  late List<QueryType1C> taskList = [];
  final Run1cRepository run1cRepository;

  RunInto1cBloc({required this.run1cRepository}) : super(RunInto1cInitial()) {
    on<RunInto1CInitialEvent>((event, emit) {
      queriesToRun = [];
      taskList = run1cRepository.initializeQueryList();
      emit(RunInto1CInitializedState(queryTypes: taskList));
    });

    on<Got1CRunQueryListEvent>((event, emit) {
      queriesToRun = event.queriesToRun;
      emit(RunInto1CGotQueriesState());
      //print(event.run1CParam);
    });

    on<RunInto1CDoRow14ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do14(event.row14, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow12ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do12(event.row12, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow18ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do12(event.row18, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow1ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do1(event.row1, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow4ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do4(event.row4, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow2ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do2(event.row2, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow13ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do13(event.row13, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow7ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do7(event.row7, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow8ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do8(event.row8, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow9ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do9(event.row9, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow16ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do16(event.row16, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow15ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do15(event.row15, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });

    on<RunInto1CDoRow17ReportsEvent>((event, emit) async {
      emit(RunInto1CMakeFilesRequestState());
      try {
        await run1cRepository.do17(event.row17, event.queryName);
        emit(RunInto1CMakeFilesRanWithSuccessState());
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(RunInto1CMakeFilesRanAndFailedState());
      }
    });
  }
}
