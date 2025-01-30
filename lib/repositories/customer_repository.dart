import 'package:dio/dio.dart';
//import 'package:giis_dmdk_app/entities/customer/customer_for_ticket.dart';
//import 'package:giis_dmdk_app/entities/ticket/unregistered_ticket.dart';
import 'package:mtwin_1c_app/repositories/auth_repository.dart';
//import 'package:logger/logger.dart';

class CustomerRepository {
  Dio dio = Dio();
  final AuthRepository authRepository;
  // final logger = Logger(
  //   printer: PrettyPrinter(),
  // );

  CustomerRepository(this.authRepository);

  Future<bool> prepareDio(String envi) async {
    try {
      final token = authRepository.tokenStuff['customer']?['accessToken'];
      if (token == null || token == '') return false;
      dio.interceptors.clear();
      dio.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      }));
      if (envi.toUpperCase() == 'DEV') {
        dio.options.baseUrl =
            'https://dev-ws.mtwin.ru/CustomerService/api/Customer/';
      } else if (envi.toUpperCase() == 'PROD') {
        dio.options.baseUrl =
            'https://ws.mtwin.ru/CustomerService/api/Customer/';
      } else {
        dio.options.baseUrl = 'http://localhost:54113/api/Customer/';
      }
      //logger.i('Customer repo: dio base url has been changed!');
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  // Future<CustomerForTicket?> requestToGetCustomerInfoForTicket(
  //     String customerId) async {
  //   //logger.i('inside of requestToGetCustomerInfoForTicket function');
  //   try {
  //     var response = await dio.get('GetCustomerInfoForTicket',
  //         queryParameters: {'customerId': customerId});
  //     final int? statusCode = response.statusCode;
  //     if (statusCode! < 200 || statusCode > 400) {
  //       return null;
  //     } else {
  //       var s = (response.data as Map<String, dynamic>);

  //       late CustomerForTicket cust = CustomerForTicket.fromJson(s);
  //       //logger.i(
  //       //'Inside of requestToGetCustomerInfoForTicket cust = $cust and type id ${cust.runtimeType}');
  //       return cust;
  //     }
  //   } on DioException catch (e) {
  //     final String msg = e.response?.data['exceptionMessage'];
  //     if (e.response?.statusCode == 404) {
  //       logger.e(msg);
  //     } else {
  //       logger.e(msg);
  //     }
  //     return null;
  //   }
  // }
}
