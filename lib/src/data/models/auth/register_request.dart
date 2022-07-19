class RegisterRequest {
  String? name;
  String? phone;
  String? registrationSource;
  String? tag;

  RegisterRequest({this.name, this.phone, this.tag, this.registrationSource});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['tag'] = this.tag;
    data['registration_source'] = this.registrationSource;
    return data;
  }
}
