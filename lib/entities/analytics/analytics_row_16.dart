class AnalyticsRow16 {
  final String ticketId;
  final String id;
  final String dept;
  final String soldByPartsDate;
  final String pawnObjectBuyer;
  final String pawnObjectBuyerAgreement;
  final String customerId;
  final double amount;
  final double principalAmount;
  final double interestAmount;
  final double pawnAmount;
  final double sellPrice;
  final String ticketObjectId;
  final double refundAmount;
  final String paymentForm;

  AnalyticsRow16({
    required this.ticketId,
    required this.id,
    required this.dept,
    required this.soldByPartsDate,
    required this.pawnObjectBuyer,
    required this.pawnObjectBuyerAgreement,
    required this.customerId,
    required this.amount,
    required this.principalAmount,
    required this.interestAmount,
    required this.pawnAmount,
    required this.sellPrice,
    required this.ticketObjectId,
    required this.refundAmount,
    required this.paymentForm,
  });

  factory AnalyticsRow16.fromJson(Map<String, dynamic> json) => AnalyticsRow16(
        ticketId: json["ticketId"] ?? "n/a",
        id: json["id"] ?? "n/a",
        dept: json["dept"] ?? "n/a",
        soldByPartsDate: json["soldByPartsDate"] ?? "n/a",
        pawnObjectBuyer: json["pawnObjectBuyer"] ?? "n/a",
        pawnObjectBuyerAgreement: json["pawnObjectBuyerAgreement"] ?? "n/a",
        customerId: json["customerId"] ?? "n/a",
        amount: json["amount"] ?? -1,
        interestAmount: json["interestAmount"] ?? -1,
        principalAmount: json["principalAmount"] ?? -1,
        pawnAmount: json["pawnAmount"] ?? -1,
        refundAmount: json["refundAmount"] ?? -1,
        sellPrice: json["sellPrice"] ?? -1,
        ticketObjectId: json["ticketObjectId"] ?? "n/a",
        paymentForm: json["paymentForm"] ?? "n/a",
      );
}
