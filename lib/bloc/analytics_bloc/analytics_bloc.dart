import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_data_to_make_files.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_14.dart';
import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';
import 'package:mtwin_1c_app/repositories/analytics_repository.dart';
//import 'package:mtwin_1c_app/entities/analytics/ticket_openings.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsRepository analyticsRepository;
  AnalyticsRow14? row14Data;
  //late List<TicketOpenings> ticketOpeningsList;
  //late List<AnalyticsDataToMakeFiles> analyticsDataToMakeFiles;

  AnalyticsBloc({required this.analyticsRepository})
      : super(AnalyticsInitial()) {
    on<AnalyticsInitialEvent>((event, emit) async {
      //logger.i('Inside ticket bloc line 21');
      //var wasSuccessfull = await analyticsRepository.prepareDio(event.envi);
      var wasSuccessfull = await analyticsRepository.prepareDio('DEBUG');
    });

    on<AnalyticsRequestToFetchDataEvent>((event, emit) async {
      emit(AnalyticsRequestToFetchDataStartedState());
      try {
        switch (event.taskToRun.id) {
          case 14:
            row14Data = await analyticsRepository.getRow14(
                dateStart: event.dateStart, dateEnd: event.dateEnd);
            break;
        }
      } catch (e) {
        myLogger.e(e.toString());
        SnackbarGlobal.show(e.toString(), 10, 'error');
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
