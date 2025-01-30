class Run1CTicketOpenings {
  final int msgId;
  final String msgType;
  //final msgData;

  Run1CTicketOpenings({required this.msgId, required this.msgType});

  factory Run1CTicketOpenings.fromJson(Map<String, dynamic> json) =>
      Run1CTicketOpenings(msgId: json['msgId'], msgType: json['msgType']);

  Map<String, dynamic> toJson() {
    return {'msgId': msgId, 'msgType': msgType};
  }
}
