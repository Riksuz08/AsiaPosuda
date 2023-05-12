class VerifyRequest {
  final String registerType;
  final Map<dynamic, dynamic> data;

  VerifyRequest({
    required this.registerType,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['register_type'] = registerType;
    data['data'] = this.data;
    return data;
  }
}
