class BranchesResponse {
  List<Branches> branches = [];
  String? count;

  BranchesResponse({this.branches = const [], this.count});

  BranchesResponse.fromJson(Map<String, dynamic> json) {
    branches = <Branches>[];
    if (json['branches'] != null) {
      json['branches'].forEach((v) {
        branches.add(Branches.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.branches != null) {
      data['branches'] = this.branches.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Branches {
  bool? checked;
  String? id;
  String? shipperId;
  String? name;
  String? image;
  String? phone;
  bool? isActive;
  String? address;
  BranchLocation? location;
  String? createdAt;
  String? updatedAt;
  String? destination;
  String? workHourStart;
  String? workHourEnd;
  String? jowiId;
  String? iikoId;
  String? iikoTerminalId;
  String? fareId;
  String? tgChatId;
  num? distance;

  Branches({
    this.id,
    this.shipperId,
    this.name,
    this.image,
    this.phone,
    this.isActive,
    this.address,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.destination,
    this.workHourStart,
    this.workHourEnd,
    this.jowiId,
    this.distance,
    this.iikoId,
    this.iikoTerminalId,
    this.fareId,
    this.tgChatId,
    this.checked = false,
  });

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shipperId = json['shipper_id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    isActive = json['is_active'];
    address = json['address'];
    location = json['location'] != null
        ? BranchLocation.fromJson(json['location'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    destination = json['destination'];
    workHourStart = json['work_hour_start'];
    workHourEnd = json['work_hour_end'];
    jowiId = json['jowi_id'];
    iikoId = json['iiko_id'];
    iikoTerminalId = json['iiko_terminal_id'];
    fareId = json['fare_id'];
    tgChatId = json['tg_chat_id'];
    distance = json['distance'] ?? 0.0;
    checked = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['shipper_id'] = this.shipperId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['is_active'] = this.isActive;
    data['address'] = this.address;
    if (this.location != null) {
      data['location'] = this.location?.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['destination'] = this.destination;
    data['distance'] = this.distance;
    data['work_hour_start'] = this.workHourStart;
    data['work_hour_end'] = this.workHourEnd;
    data['jowi_id'] = this.jowiId;
    data['iiko_id'] = this.iikoId;
    data['iiko_terminal_id'] = this.iikoTerminalId;
    data['fare_id'] = this.fareId;
    data['tg_chat_id'] = this.tgChatId;
    return data;
  }
}

class BranchLocation {
  num? long;
  num? lat;

  BranchLocation({this.long, this.lat});

  BranchLocation.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}
