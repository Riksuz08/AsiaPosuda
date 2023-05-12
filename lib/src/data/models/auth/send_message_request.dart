class SendMessageRequest {
  SendMessageRequest({
    this.clientType,
    this.email,
    this.googleToken,
    this.phone,
    this.registerType,
  });

  SendMessageRequest.fromJson(dynamic json) {
    clientType = json['client_type'];
    email = json['email'];
    googleToken = json['google_token'];
    phone = json['phone'];
    registerType = json['register_type'];
  }

  String? clientType;
  String? email;
  String? googleToken;
  String? phone;
  String? registerType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_type'] = clientType;
    map['email'] = email;
    map['google_token'] = googleToken;
    map['phone'] = phone;
    map['register_type'] = registerType;
    return map;
  }
}
