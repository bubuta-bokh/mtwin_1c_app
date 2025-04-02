class AnalyticsRow9 {
  final String id;
  final String dept;
  final String customerId;
  final String soldDate;
  final String loan;
  final String accrual;
  final double amount;

  AnalyticsRow9(
      {required this.id,
      required this.dept,
      required this.customerId,
      required this.soldDate,
      required this.loan,
      required this.accrual,
      required this.amount});

  factory AnalyticsRow9.fromJson(Map<String, dynamic> json) => AnalyticsRow9(
        id: json["id"] ?? "n/a",
        dept: json["dept"] ?? "n/a",
        customerId: json["customerId"] ?? "n/a",
        soldDate: json["soldDate"] ?? "n/a",
        loan: json["loan"] ?? "n/a",
        accrual: json["accrual"] ?? "n/a",
        amount: json["amount"] ?? -1,
      );
}
