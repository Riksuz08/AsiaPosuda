/// count : 0
/// customer_addresses : [{"address":"string","apartment":"string","building":"string","customer_id":"string","description":"string","floor":"string","id":"string","location":{"lat":40.123,"long":60.123},"name":"string"}]

class DeleteAddressResponse {
  DeleteAddressResponse({
    this.message,
  });

  DeleteAddressResponse.fromJson(dynamic json) {
    message = json['message'];
  }
  dynamic message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
