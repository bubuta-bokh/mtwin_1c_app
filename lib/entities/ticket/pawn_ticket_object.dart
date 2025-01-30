class PawnTicketObject {
  final String ticketObjectId;
  final double amount;
  final String name;
  final String pawnObjectType;
  final String client;

  PawnTicketObject(
      {required this.ticketObjectId,
      required this.amount,
      required this.name,
      required this.pawnObjectType,
      required this.client});

  factory PawnTicketObject.fromJson(Map<String, dynamic> jason) =>
      PawnTicketObject(
          ticketObjectId: jason["ticketObjectId"] ?? "n/a",
          amount: jason["amount"] ?? -1,
          name: jason["name"] ?? "n/a",
          pawnObjectType: jason["pawnObjectType"] ?? "n/a",
          client: jason["client"] ?? "n/a");
}
