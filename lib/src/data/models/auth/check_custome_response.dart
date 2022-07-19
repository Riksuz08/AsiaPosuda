class CheckCustomerResponse {
  String? id;
  String? name;
  String? phone;
  bool? isBlocked;
  String? createdAt;
  String? fcmToken;
  String? tgChatId;

  CheckCustomerResponse({
    this.id,
    this.name,
    this.phone,
    this.isBlocked,
    this.createdAt,
    this.fcmToken,
    this.tgChatId,
  });

  CheckCustomerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    isBlocked = json['is_blocked'];
    createdAt = json['created_at'];
    fcmToken = json['fcm_token'];
    tgChatId = json['tg_chat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['is_blocked'] = this.isBlocked;
    data['created_at'] = this.createdAt;
    data['fcm_token'] = this.fcmToken;
    data['tg_chat_id'] = this.tgChatId;
    return data;
  }
}
