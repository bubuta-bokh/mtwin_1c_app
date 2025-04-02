class AnalyticsRow14 {
  final String id;
  final String ticketId;
  final String dept;
  final String customerId;
  final String repaymentDate;
  final String accrual;
  final double amount;

  AnalyticsRow14(
      {required this.id,
      required this.ticketId,
      required this.dept,
      required this.customerId,
      required this.repaymentDate,
      required this.accrual,
      required this.amount});

  factory AnalyticsRow14.fromJson(Map<String, dynamic> json) => AnalyticsRow14(
        id: json["id"] ?? "n/a",
        ticketId: json["ticketId"] ?? "n/a",
        dept: json["dept"] ?? "n/a",
        customerId: json["customerId"] ?? "n/a",
        repaymentDate: json["repaymentDate"] ?? "n/a",
        accrual: json["accrual"] ?? "n/a",
        amount: json["amount"] ?? -1,
      );
}
