import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_14.dart';
// import 'package:giis_dmdk_app/entities/dmdk/already_sold_ticket_objects.dart';
// import 'package:giis_dmdk_app/entities/dmdk/answer_check_get_batch_ticket.dart';
// import 'package:giis_dmdk_app/entities/dmdk/in_circulation_ticket_objects.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row1218.dart';
// import 'package:giis_dmdk_app/entities/ticket/ontrade_uncirculated_whole_ticket.dart';
// import 'package:giis_dmdk_app/entities/ticket/registered_unuined_ticket.dart';
// import 'package:giis_dmdk_app/entities/ticket/repayed_uined_ticket.dart';
// import 'package:giis_dmdk_app/entities/ticket/sold_ticket_object.dart';
// import 'package:giis_dmdk_app/entities/ticket/unregistered_ticket.dart';
import 'package:mtwin_1c_app/repositories/auth_repository.dart';
import 'package:mtwin_1c_app/entities/results_and_errors.dart';
//import 'package:logger/logger.dart';

class AnalyticsRepository {
  Dio dio = Dio();
  Dio dioto = Dio();
  final AuthRepository authRepository;
  // final logger = Logger(
  //   printer: PrettyPrinter(),
  // );

  AnalyticsRepository(this.authRepository);

  Future<bool> prepareDio(String envi) async {
    try {
      final token = authRepository.tokenStuff['analytics']?['accessToken'];
      dio.interceptors.clear();
      dio.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      }));
      dioto.interceptors.clear();
      dioto.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      }));
      if (envi.toUpperCase() == 'DEV') {
        dio.options.baseUrl =
            'https://dev-ws.mtwin.ru/AnalyticsService/api/PortalAnalytics/';
      } else if (envi.toUpperCase() == 'PROD') {
        dio.options.baseUrl =
            'https://ws.mtwin.ru/AnalyticsService/api/PortalAnalytics/';
      } else {
        dio.options.baseUrl = 'http://localhost:65276/api/PortalAnalytics/';
      }

      //logger.i('Dio base url has changed!');
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<List<AnalyticsRow1218>?> getRow12And18(
      {required String dateStart,
      required String dateEnd,
      required bool oneDay}) async {
    try {
      var response = await dio.get('GetRow12And18For1C', queryParameters: {
        'startDate': dateStart,
        'endDate': dateEnd,
        'oneDay': oneDay
      });
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        return null;
      } else {
        var s = response.data as List;
        List<AnalyticsRow1218> ticketList = [];
        for (var element in s) {
          ticketList.add(AnalyticsRow1218.fromJson(element));
        }
        return ticketList;
      }
    } on DioException catch (e) {
      final String msg = e.response?.data['exceptionMessage'];
      if (e.response?.statusCode == 404) {
        print(msg);
      } else {
        print(msg);
      }
      return null;
    }
  }

  //Future<List<AnalyticsRow14>?> getRow14(
  Future<AnalyticsRow14> getRow14(
      {required String dateStart, required String dateEnd}) async {
    try {
      var response = await dio.get('GetRow14For1C',
          queryParameters: {'startDate': dateStart, 'endDate': dateEnd});
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
            "Сервер бэк-энда вернул статус-код ошибки: $statusCode.");
      } else {
        var s = (response.data as Map<String, dynamic>);
        late AnalyticsRow14 row14 = AnalyticsRow14.fromJson(s);
        return row14;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }
}
