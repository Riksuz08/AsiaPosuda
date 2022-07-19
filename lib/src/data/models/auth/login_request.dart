class LoginRequest {
  String? phone;
  String? tag;

  LoginRequest({this.phone, this.tag});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['tag'] = this.tag;
    return data;
  }
}
