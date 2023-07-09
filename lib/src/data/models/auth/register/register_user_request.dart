class RegisterUserRequest {
  RegisterUserRequest({
    this.userId,
    required this.clientName,
    this.cleintLastname,
    this.phoneNumber,
    this.pasport,
    required this.bloodGroup,
    this.adres,
    this.fcmToken,
    this.cleintLang,
    this.tableSlug,
  });

  RegisterUserRequest.fromJson(Map json) {
    userId = json['user_id'] as num?;
    clientName = json['client_name'] as String?;
    cleintLastname = json['cleint_lastname'] as String?;
    phoneNumber = json['phone_number'] as String?;
    pasport = json['pasport'] as String?;
    bloodGroup = json['blood_group'] as String?;
    adres = json['adres'] as String?;
    fcmToken = json['fcm_token'] as String?;
    cleintLang = json['cleint_lang'] as String?;
    tableSlug = json['table_slug'] as String?;
  }

  num? userId;
  String? clientName;
  String? cleintLastname;
  String? phoneNumber;
  String? pasport;
  String? bloodGroup;
  String? adres;
  String? fcmToken;
  String? cleintLang;
  String? tableSlug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['client_name'] = clientName;
    map['cleint_lastname'] = cleintLastname;
    map['phone_number'] = phoneNumber;
    map['pasport'] = pasport;
    map['blood_group'] = bloodGroup;
    map['adres'] = adres;
    map['fcm_token'] = fcmToken;
    map['cleint_lang'] = cleintLang;
    map['table_slug'] = 'clients';
    return map;
  }
}
