class AnalyticsRow13 {
  final String ticketId;
  final String dept;
  final String soldDate;
  final String pawnObjectBuyer;
  final String pawnObjectBuyerAgreement;
  final String customerId;
  final double amount;
  final double principalAmountBefore;
  final double interestAmountBefore;
  final double principalAmountAfter;
  final double interestAmountAfter;
  final double pawnAmount;
  final double sellPrice;
  final String ticketObjectId;
  final double refundAmount;
  final String paymentForm;

  AnalyticsRow13(
      {required this.ticketId,
      required this.dept,
      required this.soldDate,
      required this.pawnObjectBuyer,
      required this.pawnObjectBuyerAgreement,
      required this.customerId,
      required this.amount,
      required this.principalAmountBefore,
      required this.interestAmountBefore,
      required this.principalAmountAfter,
      required this.interestAmountAfter,
      required this.pawnAmount,
      required this.sellPrice,
      required this.ticketObjectId,
      required this.refundAmount,
      required this.paymentForm});

  factory AnalyticsRow13.fromJson(Map<String, dynamic> json) => AnalyticsRow13(
        ticketId: json["ticketId"] ?? "n/a",
        dept: json["dept"] ?? "n/a",
        soldDate: json["soldDate"] ?? "n/a",
        pawnObjectBuyer: json["pawnObjectBuyer"] ?? "n/a",
        pawnObjectBuyerAgreement: json["pawnObjectBuyerAgreement"] ?? "n/a",
        customerId: json["customerId"] ?? "n/a",
        amount: json["amount"] ?? -1,
        interestAmountBefore: json["interestAmountBefore"] ?? -1,
        principalAmountBefore: json["principalAmountBefore"] ?? -1,
        interestAmountAfter: json["interestAmountAfter"] ?? -1,
        principalAmountAfter: json["principalAmountAfter"] ?? -1,
        pawnAmount: json["pawnAmount"] ?? -1,
        refundAmount: json["refundAmount"] ?? -1,
        sellPrice: json["sellPrice"] ?? -1,
        ticketObjectId: json["ticketObjectId"] ?? "n/a",
        paymentForm: json["paymentForm"] ?? "n/a",
      );
}
