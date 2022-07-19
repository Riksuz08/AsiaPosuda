import 'orders_response.dart';

/// address : "string"
/// apartment : "string"
/// building : "string"
/// customer_id : "string"
/// description : "string"
/// floor : "string"
/// location : {"lat":40.123,"long":60.123}
/// name : "string"

class MyAddressRequest {
  MyAddressRequest({
    this.address,
    this.apartment,
    this.building,
    this.customerId,
    this.description,
    this.floor,
    this.location,
    this.name,
  });

  MyAddressRequest.fromJson(dynamic json) {
    address = json['address'];
    apartment = json['apartment'];
    building = json['building'];
    customerId = json['customer_id'];
    description = json['description'];
    floor = json['floor'];
    location =
        json['location'] != null ? ToLocation.fromJson(json['location']) : null;
    name = json['name'];
  }
  String? address;
  String? apartment;
  String? building;
  String? customerId;
  String? description;
  String? floor;
  ToLocation? location;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['apartment'] = apartment;
    map['building'] = building;
    map['customer_id'] = customerId;
    map['description'] = description;
    map['floor'] = floor;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['name'] = name;
    return map;
  }
}

/// lat : 40.123
/// long : 60.123
