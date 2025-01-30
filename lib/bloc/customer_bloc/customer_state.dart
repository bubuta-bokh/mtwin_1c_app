part of 'customer_bloc.dart';

sealed class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

final class CustomerInitial extends CustomerState {}

// final class CustomerStateToRequestTicketInfoState extends CustomerState {}

// final class CustomerRequestToLoadTicketInfoSuccessState extends CustomerState {
//   final CustomerForTicket customerForTicket;

//   const CustomerRequestToLoadTicketInfoSuccessState(this.customerForTicket);
//   @override
//   List<Object> get props => [];
// }

// final class CustomerRequestToLoadTicketInfoFailState extends CustomerState {}
