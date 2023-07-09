class VerifyRequest {
  const VerifyRequest({
    required this.registerType,
    required this.data,
  });

  final String registerType;
  final Map<dynamic, dynamic> data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['register_type'] = registerType;
    data['data'] = this.data;
    return data;
  }
}
