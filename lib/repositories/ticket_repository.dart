import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:giis_dmdk_app/entities/dmdk/already_sold_ticket_objects.dart';
// import 'package:giis_dmdk_app/entities/dmdk/answer_check_get_batch_ticket.dart';
// import 'package:giis_dmdk_app/entities/dmdk/in_circulation_ticket_objects.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row1218.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_14.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
import 'package:mtwin_1c_app/entities/results_and_errors.dart';
// import 'package:giis_dmdk_app/entities/ticket/ontrade_uncirculated_whole_ticket.dart';
// import 'package:giis_dmdk_app/entities/ticket/registered_unuined_ticket.dart';
// import 'package:giis_dmdk_app/entities/ticket/repayed_uined_ticket.dart';
// import 'package:giis_dmdk_app/entities/ticket/sold_ticket_object.dart';
// import 'package:giis_dmdk_app/entities/ticket/unregistered_ticket.dart';
import 'package:mtwin_1c_app/repositories/auth_repository.dart';
//import 'package:logger/logger.dart';

class TicketRepository {
  Dio dio = Dio();
  Dio dioto = Dio();
  final AuthRepository authRepository;
  // final logger = Logger(
  //   printer: PrettyPrinter(),
  // );

  TicketRepository(this.authRepository);

  void doAuthStuff(envi) {
    final token = authRepository.tokenStuff['ticket']?['accessToken'];
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers["Authorization"] = "Bearer $token";
          return handler.next(options);
        },
      ),
    );
    dioto.interceptors.clear();
    dioto.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers["Authorization"] = "Bearer $token";
          return handler.next(options);
        },
      ),
    );
  }

  Future<bool> prepareDio(String envi) async {
    //try {
    final token = authRepository.tokenStuff['ticket']?['accessToken'];
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers["Authorization"] = "Bearer $token";
          return handler.next(options);
        },
      ),
    );
    dioto.interceptors.clear();
    dioto.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers["Authorization"] = "Bearer $token";
          return handler.next(options);
        },
      ),
    );

    if (envi.toUpperCase() == 'DEV') {
      dio.options.baseUrl =
          authRepository.config == null
              ? "https://dev-ws.mtwin.ru/TicketService/api/FinanceRebuild/"
              : authRepository.config!.ticketDevCtrl;
      //"https://dev-ws.mtwin.ru/TicketService/api/FinanceRebuild/";
      dioto.options.baseUrl =
          authRepository.config == null
              ? "https://dev-ws.mtwin.ru/TicketService/api/TicketObject/"
              : authRepository.config!.ticketObjectDevCtrl;
      //"https://dev-ws.mtwin.ru/TicketService/api/TicketObject/";
    } else if (envi.toUpperCase() == 'PROD') {
      dio.options.baseUrl =
          authRepository.config == null
              ? "https://ws.mtwin.ru/TicketService/api/FinanceRebuild/"
              : authRepository.config!.ticketProdCtrl;
      //          "https://ws.mtwin.ru/TicketService/api/FinanceRebuild/";
      dioto.options.baseUrl =
          authRepository.config == null
              ? "https://ws.mtwin.ru/TicketService/api/TicketObject/"
              : authRepository.config!.ticketObjectProdCtrl;
      //          "https://ws.mtwin.ru/TicketService/api/TicketObject/";
    } else {
      dio.options.baseUrl =
          authRepository.config == null
              ? "http://localhost:64400/api/FinanceRebuild/"
              : authRepository.config!.ticketDebugCtrl;
      dioto.options.baseUrl =
          authRepository.config == null
              ? "http://localhost:64400/TicketService/api/TicketObject/"
              : authRepository.config!.ticketObjectDebugCtrl;
      //          "http://localhost:64400/TicketService/api/TicketObject/";
    }

    //logger.i('Dio base url has changed!');
    return true;
    //} on Exception catch (e) {
    //  return throw Exception(e);
    // }
  }

  Future<bool> rebuildFinance(String dateStart, String dateEnd) async {
    try {
      var response = await dio.get(
        'RebuildFinance',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        return false;
      } else {
        return true;
      }
    } on DioException catch (e) {
      final String msg = e.response?.data['exceptionMessage'];
      if (e.response?.statusCode == 404) {
        print(msg);
      } else {
        print(msg);
      }
      return false;
    }
  }

  Future<bool> rebuildFinanceWithTicketSoldEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'RebuildFinanceTicketSold',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketSoldByPartsEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'RebuildFinanceTicketSoldByParts',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketPayoutEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'RebuildFinanceTicketPayoutEvent',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketCounterPayedOutEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'FinanceTicketCounterPayoutEvent',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketInterestRepaymentEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'FinanceTicketInterestRepayedEvent',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketLoanRepaymentEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'FinanceTicketLoanRepayedEvent',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketCounterInterestRepaymentEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'FinanceTicketCounterInterestRepayedEvent',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketCounterLoanRepaymentEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'FinanceTicketCounterLoanRepayedEvent',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> rebuildFinanceWithTicketCounterSoldByPartsEvent(
    String dateStart,
    String dateEnd,
  ) async {
    try {
      var response = await dio.get(
        'FinanceTicketCounterSoldByPartsEvent',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        return true;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }
}
