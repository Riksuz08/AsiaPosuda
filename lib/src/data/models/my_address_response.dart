/// count : 0
/// customer_addresses : [{"address":"string","apartment":"string","building":"string","customer_id":"string","description":"string","floor":"string","id":"string","location":{"lat":40.123,"long":60.123},"name":"string"}]

class MyAddressResponse {
  MyAddressResponse({
    this.count,
    this.minimalOrderPrice,
    this.customerAddresses,
  });

  MyAddressResponse.fromJson(dynamic json) {
    count = json['count'];
    minimalOrderPrice = json['minimal_order_price'];
    if (json['customer_addresses'] != null) {
      customerAddresses = [];
      json['customer_addresses'].forEach((v) {
        customerAddresses?.add(CustomerAddresses.fromJson(v));
      });
    }
  }

  String? count;
  dynamic minimalOrderPrice;
  List<CustomerAddresses>? customerAddresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['minimal_order_price'] = minimalOrderPrice;
    if (customerAddresses != null) {
      map['customer_addresses'] =
          customerAddresses?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// address : "string"
/// apartment : "string"
/// building : "string"
/// customer_id : "string"
/// description : "string"
/// floor : "string"
/// id : "string"
/// location : {"lat":40.123,"long":60.123}
/// name : "string"

class CustomerAddresses {
  CustomerAddresses({
    this.address,
    this.apartment,
    this.building,
    this.customerId,
    this.description,
    this.floor,
    this.id,
    this.location,
    this.name,
  });

  CustomerAddresses.fromJson(dynamic json) {
    address = json['address'];
    apartment = json['apartment'];
    building = json['building'];
    customerId = json['customer_id'];
    description = json['description'];
    floor = json['floor'];
    id = json['id'];
    location = json['location'] != null
        ? LocationModel.fromJson(json['location'])
        : null;
    name = json['name'];
  }
  String? address;
  String? apartment;
  String? building;
  String? customerId;
  String? description;
  String? floor;
  String? id;
  LocationModel? location;
  String? name;
  bool isChecked=false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['apartment'] = apartment;
    map['building'] = building;
    map['customer_id'] = customerId;
    map['description'] = description;
    map['floor'] = floor;
    map['id'] = id;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['name'] = name;
    return map;
  }
}

/// lat : 40.123
/// long : 60.123

class LocationModel {
  LocationModel({
    this.lat,
    this.long,
  });

  LocationModel.fromJson(dynamic json) {
    lat = json['lat'];
    long = json['long'];
  }
  num? lat;
  num? long;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['long'] = long;
    return map;
  }
}
