import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_13.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_15.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_17.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row1218.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_1.dart';
//import 'package:mtwin_1c_app/entities/analytics/analytics_data_to_make_files.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_14.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_16.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_2.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_4.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_7.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_8.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_9.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';
import 'package:mtwin_1c_app/repositories/analytics_repository.dart';
//import 'package:mtwin_1c_app/entities/analytics/ticket_openings.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsRepository analyticsRepository;
  List<AnalyticsRow14>? row14Data;
  List<AnalyticsRow1>? row1Data;
  List<AnalyticsRow2>? row2Data;
  List<AnalyticsRow4>? row4Data;
  List<AnalyticsRow7>? row7Data;
  List<AnalyticsRow8>? row8Data;
  List<AnalyticsRow9>? row9Data;
  List<AnalyticsRow13>? row13Data;
  List<AnalyticsRow16>? row16Data;
  List<AnalyticsRow15>? row15Data;
  List<AnalyticsRow17>? row17Data;
  List<AnalyticsRow1218>? row1218Data;
  AppConfig? config;
  //late List<TicketOpenings> ticketOpeningsList;
  //late List<AnalyticsDataToMakeFiles> analyticsDataToMakeFiles;

  AnalyticsBloc({required this.analyticsRepository})
    : super(AnalyticsInitial()) {
    on<AnalyticsInitialEvent>((event, emit) async {
      try {
        if (!event.loadingStage) analyticsRepository.prepareDio(event.envi);
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(
          '${e.toString()}. Не удалось настроить приложение для работы с аналитикой.',
          15,
          'error',
        );
      }
      //var wasSuccessfull = await analyticsRepository.prepareDio(event.envi);
    });

    on<AnalyticsConfigReadyEvent>((event, emit) async {
      try {
        config = event.config;
        // await analyticsRepository.prepareDio(event.config);
      } on Exception catch (e, _) {
        SnackbarGlobal.show(
          '${e.toString()}. Не удалось загрузить конфигурацию приложения.',
          15,
          'error',
        );
      }
    });

    on<AnalyticsResetToInitialEvent>((event, emit) async {
      row14Data = [];
      row1Data = [];
      row2Data = [];
      row4Data = [];
      row7Data = [];
      row8Data = [];
      row9Data = [];
      row16Data = [];
      row15Data = [];
      row13Data = [];
      row17Data = [];
      row1218Data = [];
      emit(AnalyticsInitial());
    });

    on<AnalyticsRequestToFetchDataEvent>((event, emit) async {
      emit(AnalyticsRequestToFetchDataStartedState());
      try {
        switch (event.taskToRun.id) {
          case 1:
            row1Data = await analyticsRepository.getRow1(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 2:
            row2Data = await analyticsRepository.getRow2(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 4:
            row4Data = await analyticsRepository.getRow4(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 7:
            row7Data = await analyticsRepository.getRow7(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 8:
            row8Data = await analyticsRepository.getRow8(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 9:
            row9Data = await analyticsRepository.getRow9(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 13:
            row13Data = await analyticsRepository.getRow13(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 14:
            row14Data = await analyticsRepository.getRow14(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 15:
            row15Data = await analyticsRepository.getRow15(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 16:
            row16Data = await analyticsRepository.getRow16(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 17:
            row17Data = await analyticsRepository.getRow17(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 12:
            row1218Data = await analyticsRepository.getRow12And18(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
              oneDay: false,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
          case 18:
            row1218Data = await analyticsRepository.getRow12And18(
              dateStart: event.dateStart,
              dateEnd: event.dateEnd,
              oneDay: true,
            );
            emit(
              AnalyticsRequestToFetchDataSuccededState(
                taskId: event.taskToRun.id,
              ),
            );
            break;
        }
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 20, 'error');
        emit(AnalyticsRequestToFetchDataFailedState());
      }
      // bool totalSuccess = true;
      // for (var c in event.taskToRun) {
      //   if (c.id == 12) {
      //     var result = await analyticsRepository.getRow12And18(
      //         dateStart: event.dateStart,
      //         dateEnd: event.dateEnd,
      //         oneDay: false);
      //     if (result != null) {
      //       analyticsDataToMakeFiles
      //           .add(AnalyticsDataToMakeFiles(id: 12, analyticsData: result));
      //     } else {
      //       totalSuccess = false;
      //       break;
      //     }
      //   }
      //   if (c.id == 18) {
      //     var result = await analyticsRepository.getRow12And18(
      //         dateStart: event.dateStart, dateEnd: event.dateEnd, oneDay: true);
      //     if (result != null) {
      //       analyticsDataToMakeFiles
      //           .add(AnalyticsDataToMakeFiles(id: 18, analyticsData: result));
      //     } else {
      //       totalSuccess = false;
      //       break;
      //     }
      //   }

      //   if (c.id == 14) {
      //     try {
      //       var result = await analyticsRepository.getRow14(
      //           dateStart: event.dateStart, dateEnd: event.dateEnd);
      //       analyticsDataToMakeFiles
      //           .add(AnalyticsDataToMakeFiles(id: 14, analyticsData: result));
      //       emit(AnalyticsRequestToFetchDataRow14SucceedState());
      //     } catch (e) {
      //       SnackbarGlobal.show(e.toString(), 10, 'error');
      //       emit(AnalyticsRequestToFetchDataRow14FailedState(
      //           errorMessage: e.toString()));
      //       //print(e);
      //     }
      //     // if (result != null) {
      //     //   analyticsDataToMakeFiles
      //     //       .add(AnalyticsDataToMakeFiles(id: 14, analyticsData: result));
      //     // } else {
      //     //   totalSuccess = false;
      //     //   break;
      //     // }
      //   }
      // }
      // if (totalSuccess) {
      //   emit(AnalyticsRequestToFetchDataSuccededState());
      // } else {
      //   emit(AnalyticsRequestToFetchDataFailedState());
      // }
    });
  }
}
