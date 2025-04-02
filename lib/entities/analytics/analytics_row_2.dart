class AnalyticsRow2 {
  final String id;
  final String ticketId;
  final String dept;
  final String customerId;
  final String repaymentDate;
  final String loan;
  final String accrual;
  final double amount;

  AnalyticsRow2(
      {required this.id,
      required this.ticketId,
      required this.dept,
      required this.customerId,
      required this.repaymentDate,
      required this.loan,
      required this.accrual,
      required this.amount});

  factory AnalyticsRow2.fromJson(Map<String, dynamic> json) => AnalyticsRow2(
        id: json["id"] ?? "n/a",
        ticketId: json["ticketId"] ?? "n/a",
        dept: json["dept"] ?? "n/a",
        customerId: json["customerId"] ?? "n/a",
        repaymentDate: json["repaymentDate"] ?? "n/a",
        loan: json["loan"] ?? "n/a",
        accrual: json["accrual"] ?? "n/a",
        amount: json["amount"] ?? -1,
      );
}
