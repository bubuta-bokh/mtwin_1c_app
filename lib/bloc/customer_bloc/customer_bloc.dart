import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
//import 'package:giis_dmdk_app/entities/customer/customer_for_ticket.dart';
import 'package:mtwin_1c_app/repositories/customer_repository.dart';
//import 'package:logger/logger.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  // final logger = Logger(
  //   printer: PrettyPrinter(),
  // );
  late String customerId;
  //late CustomerForTicket custInfo;

  CustomerBloc({required this.customerRepository}) : super(CustomerInitial()) {
    on<CustomerInitialEvent>((event, emit) async {
      //logger.i('f');
      //logger.i('Inside ticket bloc line 21');
      var wasSuccessfull = await customerRepository.prepareDio(event.envi);
    });

    // on<CustomerStartRegisterNewTicketEvent>((event, emit) {
    //   customerId = event.customerId;
    // });

    // on<CustomerRequestToLoadTicketInfoEvent>((event, emit) async {
    //   //customerId = event.customerId;
    //   emit(CustomerStateToRequestTicketInfoState());
    //   var rslt = await customerRepository
    //       .requestToGetCustomerInfoForTicket(event.customerId);
    //   if (rslt != null) {
    //     custInfo = rslt;
    //     debugPrint('Оглу');
    //     emit(CustomerRequestToLoadTicketInfoSuccessState(rslt));
    //   } else {
    //     emit(CustomerRequestToLoadTicketInfoFailState());
    //   }
    // });
  }
}
