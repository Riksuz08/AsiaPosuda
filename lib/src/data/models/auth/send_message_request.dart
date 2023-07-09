class SendMessageRequest {
  SendMessageRequest({
    this.clientType,
    this.email,
    this.googleToken,
    this.phone,
    this.registerType,
  });

  SendMessageRequest.fromJson(Map json) {
    clientType = json['client_type'] as String?;
    email = json['email'] as String?;
    googleToken = json['google_token'] as String?;
    phone = json['phone'] as String?;
    registerType = json['register_type'] as String?;
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
