/// count : 0
/// customer_addresses : [{"address":"string","apartment":"string","building":"string","customer_id":"string","description":"string","floor":"string","id":"string","location":{"lat":40.123,"long":60.123},"name":"string"}]

class CreateAddressResponse {
  CreateAddressResponse({
    this.id,
  });

  CreateAddressResponse.fromJson(dynamic json) {
    id = json['id'];
  }
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;

    return map;
  }
}
