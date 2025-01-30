class Customer1cOpenings {
  final String customerId;
  final String lastName;
  final String firstName;
  final String patronymic;
  final String sex;
  final String birthDate;
  final String birthPlace;
  final String citizenCountryCode;
  final bool isResident;

  Customer1cOpenings(
      {required this.customerId,
      required this.lastName,
      required this.firstName,
      required this.patronymic,
      required this.sex,
      required this.birthDate,
      required this.birthPlace,
      required this.citizenCountryCode,
      required this.isResident});

  factory Customer1cOpenings.fromJson(Map<String, dynamic> json) =>
      Customer1cOpenings(
          customerId: json["customerId"] ?? 'n/a',
          lastName: json["lastName"] ?? 'n/a',
          firstName: json["firstName"] ?? 'n/a',
          patronymic: json["patronymic"] ?? 'n/a',
          sex: json["sex"] ?? 'n/a',
          birthDate: json["birthDate"] ?? 'n/a',
          birthPlace: json["birthPlace"] ?? 'n/a',
          citizenCountryCode: json["citizenCountryCode"] ?? 'n/a',
          isResident: json["isResident"] ?? true);
}
