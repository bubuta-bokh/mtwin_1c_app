part of 'customer_bloc.dart';

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class CustomerInitialEvent extends CustomerEvent {
  final String envi;

  const CustomerInitialEvent({required this.envi});
  @override
  List<Object> get props => [envi];
}

// class CustomerRequestToLoadTicketInfoEvent extends CustomerEvent {
//   final String customerId;

//   const CustomerRequestToLoadTicketInfoEvent({required this.customerId});
//   @override
//   List<Object> get props => [customerId];
// }

// class CustomerStartRegisterNewTicketEvent extends CustomerEvent {
//   final String customerId;

//   const CustomerStartRegisterNewTicketEvent({required this.customerId});

//   @override
//   List<Object> get props => [customerId];
// }
