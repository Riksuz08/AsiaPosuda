class SavedAddressResponse {
  String? count;
  List<CustomerAddresses> customerAddresses = [];

  SavedAddressResponse({this.count, this.customerAddresses = const []});

  SavedAddressResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['customer_addresses'] != null) {
      customerAddresses = <CustomerAddresses>[];
      json['customer_addresses'].forEach((v) {
        customerAddresses.add(CustomerAddresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (customerAddresses != null) {
      data['customer_addresses'] =
          customerAddresses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerAddresses {
  String? address;
  String? apartment;
  String? building;
  String? customerId;
  String? description;
  String? floor;
  String? id;
  LocationLatLangData? location;
  String? name;

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

  CustomerAddresses.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    apartment = json['apartment'];
    building = json['building'];
    customerId = json['customer_id'];
    description = json['description'];
    floor = json['floor'];
    id = json['id'];
    location = json['location'] != null
        ? LocationLatLangData.fromJson(json['location'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['apartment'] = apartment;
    data['building'] = building;
    data['customer_id'] = customerId;
    data['description'] = description;
    data['floor'] = floor;
    data['id'] = id;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class LocationLatLangData {
  double? lat;
  double? long;

  LocationLatLangData({this.lat, this.long});

  LocationLatLangData.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}
