import 'package:mtwin_1c_app/entities/customer/customer_1c_openings.dart';
import 'package:mtwin_1c_app/entities/ticket/pawn_ticket_object.dart';

class AnalyticsRow1218 {
  final String ticketId;
  final String ticketNumber;
  final String customerId;
  final String beginDate;
  final String endDate;
  final String dept;
  final double trueInterestCost;
  final String accBegin;
  final String accEnd;
  final String sellingBeginDate;
  final double amount;
  final double sumUplatCorrect;
  final String pawnType;
  final Customer1cOpenings customerInfo;
  final List<PawnTicketObject> ticketObjectList;

  AnalyticsRow1218(
      {required this.ticketId,
      required this.ticketNumber,
      required this.customerId,
      required this.beginDate,
      required this.endDate,
      required this.dept,
      required this.trueInterestCost,
      required this.accBegin,
      required this.accEnd,
      required this.sellingBeginDate,
      required this.amount,
      required this.sumUplatCorrect,
      required this.pawnType,
      required this.customerInfo,
      required this.ticketObjectList});

  factory AnalyticsRow1218.fromJson(
          Map<String, dynamic> jason) =>
      AnalyticsRow1218(
          ticketId: jason["ticketId"] ?? "n/a",
          ticketNumber: jason["ticketNumber"] ?? "n/a",
          customerId: jason["customerId"] ?? "n/a",
          beginDate: jason["beginDate"] ?? "n/a",
          endDate: jason["endDate"] ?? "n/a",
          dept: jason["dept"] ?? "n/a",
          trueInterestCost: jason["annualInterestRate"] ?? -1,
          accBegin: jason["accBegin"] ?? "n/a",
          accEnd: jason["accEnd"] ?? "n/a",
          sellingBeginDate: jason["sellingBeginDate"] ?? "n/a",
          amount: jason["amount"] ?? -1,
          sumUplatCorrect: jason['sumUplatCorrect'] ?? -1,
          pawnType: jason["pawnType"] ?? "n/a",
          customerInfo: Customer1cOpenings.fromJson(jason["customerInfo"]),
          ticketObjectList: List<PawnTicketObject>.from(
              jason["ticketObjectList"]
                  .map((x) => PawnTicketObject.fromJson(x))));
}
