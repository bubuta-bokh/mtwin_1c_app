import 'package:dio/dio.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_13.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_15.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_17.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_1.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_14.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row1218.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_16.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_2.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_4.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_7.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_8.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_9.dart';
import 'package:mtwin_1c_app/repositories/auth_repository.dart';

class AnalyticsRepository {
  Dio dio = Dio();
  Dio dioto = Dio();
  final AuthRepository authRepository;

  AnalyticsRepository(this.authRepository);

  void doAuthStuff() {
    //try {
    final token = authRepository.tokenStuff['analytics']?['accessToken'];
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
          // print(options.headers["Authorization"]);
          return handler.next(options);
        },
      ),
    );
  }

  Future<bool> prepareDio(String envi) async {
    //try {
    final token = authRepository.tokenStuff['analytics']?['accessToken'];
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
          // print(options.headers["Authorization"]);
          return handler.next(options);
        },
      ),
    );

    if (envi.toUpperCase() == 'DEV') {
      dio.options.baseUrl =
          authRepository.config == null
              ? "https://dev-ws.mtwin.ru/AnalyticsService/api/PortalAnalytics/"
              : authRepository.config!.analyticsDevCtrl;
    } else if (envi.toUpperCase() == 'PROD') {
      dio.options.baseUrl =
          authRepository.config == null
              ? "https://ws.mtwin.ru/AnalyticsService/api/PortalAnalytics/"
              : authRepository.config!.analyticsProdCtrl;
    } else {
      dio.options.baseUrl =
          authRepository.config == null
              ? "http://localhost:65276/api/PortalAnalytics/"
              : authRepository.config!.analyticsDebugCtrl;
    }

    //logger.i('Dio base url has changed!');
    return true;
    //} on Exception catch (e) {
    //  return throw Exception(e);
    // }
  }

  Future<List<AnalyticsRow1>> getRow1({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow1For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow1> r1 = [];
        for (var element in s) {
          r1.add(AnalyticsRow1.fromJson(element));
        }
        return r1;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow4>> getRow4({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow4For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow4> r4 = [];
        for (var element in s) {
          r4.add(AnalyticsRow4.fromJson(element));
        }
        return r4;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow2>> getRow2({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow2For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow2> r2 = [];
        for (var element in s) {
          r2.add(AnalyticsRow2.fromJson(element));
        }
        return r2;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow7>> getRow7({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow7For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow7> r7 = [];
        for (var element in s) {
          r7.add(AnalyticsRow7.fromJson(element));
        }
        return r7;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow8>> getRow8({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow8For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow8> r8 = [];
        for (var element in s) {
          r8.add(AnalyticsRow8.fromJson(element));
        }
        return r8;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow9>> getRow9({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow9For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow9> r9 = [];
        for (var element in s) {
          r9.add(AnalyticsRow9.fromJson(element));
        }
        return r9;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow16>> getRow16({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow16For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow16> r16 = [];
        for (var element in s) {
          r16.add(AnalyticsRow16.fromJson(element));
        }
        return r16;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow15>> getRow15({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow15For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow15> r15 = [];
        for (var element in s) {
          r15.add(AnalyticsRow15.fromJson(element));
        }
        return r15;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow13>> getRow13({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow13For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow13> r13 = [];
        for (var element in s) {
          r13.add(AnalyticsRow13.fromJson(element));
        }
        return r13;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow17>> getRow17({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow17For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow17> r17 = [];
        for (var element in s) {
          r17.add(AnalyticsRow17.fromJson(element));
        }
        return r17;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow14>> getRow14({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      var response = await dio.get(
        'GetRow14For1C',
        queryParameters: {'startDate': dateStart, 'endDate': dateEnd},
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow14> r14 = [];
        for (var element in s) {
          r14.add(AnalyticsRow14.fromJson(element));
        }
        return r14;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<AnalyticsRow1218>> getRow12And18({
    required String dateStart,
    required String dateEnd,
    required bool oneDay,
  }) async {
    try {
      var response = await dio.get(
        'GetRow12And18For1C',
        queryParameters: {
          'startDate': dateStart,
          'endDate': dateEnd,
          'oneDay': oneDay,
        },
      );
      final int? statusCode = response.statusCode;
      if (statusCode! < 200 || statusCode > 400) {
        throw Exception(
          "Сервер бэк-энда вернул статус-код ошибки: $statusCode.",
        );
      } else {
        var s = response.data as List;
        List<AnalyticsRow1218> r1218 = [];
        for (var element in s) {
          r1218.add(AnalyticsRow1218.fromJson(element));
        }
        return r1218;
      }
    } on DioException catch (e) {
      return throw Exception(e);
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }
}
