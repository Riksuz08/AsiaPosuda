class ConfirmLoginRequest {
  String? code;
  String? fcmToken;
  String? phone;

  ConfirmLoginRequest({this.code, this.fcmToken='', this.phone});

  ConfirmLoginRequest.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    fcmToken = json['fcm_token'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['fcm_token'] = this.fcmToken;
    data['phone'] = this.phone;
    return data;
  }
}
