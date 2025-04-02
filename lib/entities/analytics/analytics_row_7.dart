class AnalyticsRow7 {
  final String id;
  final String dept;
  final String customerId;
  final String soldDate;
  final String loan;
  final String accrual;
  final double amount;

  AnalyticsRow7(
      {required this.id,
      required this.dept,
      required this.customerId,
      required this.soldDate,
      required this.loan,
      required this.accrual,
      required this.amount});

  factory AnalyticsRow7.fromJson(Map<String, dynamic> json) => AnalyticsRow7(
        id: json["id"] ?? "n/a",
        dept: json["dept"] ?? "n/a",
        customerId: json["customerId"] ?? "n/a",
        soldDate: json["soldDate"] ?? "n/a",
        loan: json["loan"] ?? "n/a",
        accrual: json["accrual"] ?? "n/a",
        amount: json["amount"] ?? -1,
      );
}
