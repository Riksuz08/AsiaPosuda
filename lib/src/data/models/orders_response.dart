class OrdersResponse {
  List<Orders> orders = [];
  String? count;

  OrdersResponse({this.orders = const [], this.count});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
    orders = <Orders>[];
    if (json['orders'] != null) {
      json['orders'].forEach((v) {
        orders.add(Orders.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders'] = orders.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

class Orders {
  ToLocation? toLocation;
  String? toAddress;
  String? clientName;
  String? clientPhoneNumber;
  int? coDeliveryPrice;
  String? description;
  String? externalOrderId;
  String? deliveryTime;
  String? deliveryType;
  String? id;
  String? clientId;
  String? courierId;
  Courier? courier;
  String? statusId;
  String? createdAt;
  String? finishedAt;
  String? paymentType;
  String? source;
  String? apartment;
  String? building;
  String? floor;
  String? extraPhoneNumber;
  int? orderAmount;
  bool? paid;
  String? rating;
  String? review;
  ShipperUser? shipperUser;
  List<Steps> steps = [];
  List<StatusNotes> statusNotes = [];
  dynamic jowiId;
  dynamic iikoId;
  dynamic distance;

  Orders({
    this.toLocation,
    this.toAddress,
    this.clientName,
    this.clientPhoneNumber,
    this.coDeliveryPrice,
    this.description,
    this.externalOrderId,
    this.deliveryTime,
    this.deliveryType,
    this.id,
    this.clientId,
    this.courierId,
    this.courier,
    this.statusId,
    this.createdAt,
    this.finishedAt,
    this.paymentType,
    this.source,
    this.apartment,
    this.building,
    this.floor,
    this.extraPhoneNumber,
    this.orderAmount,
    this.paid,
    this.rating,
    this.review,
    this.shipperUser,
    this.steps = const [],
    this.statusNotes = const [],
    this.jowiId,
    this.iikoId,
    this.distance,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    toLocation = json['to_location'] != null
        ? ToLocation.fromJson(json['to_location'])
        : null;
    toAddress = json['to_address'];
    clientName = json['client_name'];
    clientPhoneNumber = json['client_phone_number'];
    coDeliveryPrice = json['co_delivery_price'];
    description = json['description'];
    externalOrderId = json['external_order_id'];
    deliveryTime = json['delivery_time'];
    deliveryType = json['delivery_type'];
    id = json['id'];
    clientId = json['client_id'];
    courierId = json['courier_id'];
    courier =
        json['courier'] != null ? Courier.fromJson(json['courier']) : null;
    statusId = json['status_id'];
    createdAt = json['created_at'];
    finishedAt = json['finished_at'];
    paymentType = json['payment_type'];
    source = json['source'];
    apartment = json['apartment'];
    building = json['building'];
    floor = json['floor'];
    extraPhoneNumber = json['extra_phone_number'];
    orderAmount = json['order_amount'];
    paid = json['paid'];
    rating = json['rating'];
    review = json['review'];
    steps = <Steps>[];
    if (json['steps'] != null) {
      json['steps'].forEach((v) {
        steps.add(Steps.fromJson(v));
      });
    }
    statusNotes = <StatusNotes>[];
    if (json['status_notes'] != null) {
      json['status_notes'].forEach((v) {
        statusNotes.add(new StatusNotes.fromJson(v));
      });
    }
    shipperUser = json['shipper_user'] != null
        ? ShipperUser.fromJson(json['shipper_user'])
        : null;
    jowiId = json['jowi_id'];
    iikoId = json['iiko_id'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.toLocation != null) {
      data['to_location'] = this.toLocation?.toJson();
    }
    data['to_address'] = this.toAddress;
    data['client_name'] = this.clientName;
    data['client_phone_number'] = this.clientPhoneNumber;
    data['co_delivery_price'] = this.coDeliveryPrice;
    data['description'] = this.description;
    data['external_order_id'] = this.externalOrderId;
    data['delivery_time'] = this.deliveryTime;
    data['delivery_type'] = this.deliveryType;
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['courier_id'] = this.courierId;
    if (this.courier != null) {
      data['courier'] = this.courier?.toJson();
    }
    data['status_id'] = this.statusId;
    data['created_at'] = this.createdAt;
    data['finished_at'] = this.finishedAt;
    data['payment_type'] = this.paymentType;
    data['source'] = this.source;
    data['apartment'] = this.apartment;
    data['building'] = this.building;
    data['floor'] = this.floor;
    data['extra_phone_number'] = this.extraPhoneNumber;
    data['order_amount'] = this.orderAmount;
    data['paid'] = this.paid;
    data['rating'] = this.rating;
    data['review'] = this.review;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    if (this.statusNotes != null) {
      data['status_notes'] = this.statusNotes.map((v) => v).toList();
    }
    return data;
  }
}

class ToLocation {
  dynamic long;
  dynamic lat;

  ToLocation({this.long, this.lat});

  ToLocation.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    lat = json['lat'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['long'] = this.long;
  //   data['lat'] = this.lat;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class StatusNotes {
  String? id;
  String? orderId;
  String? statusId;
  String? description;
  String? createdAt;

  StatusNotes({
    this.id,
    this.orderId,
    this.statusId,
    this.description,
    this.createdAt,
  });

  StatusNotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    statusId = json['status_id'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['status_id'] = this.statusId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class ShipperUser {
  String? id;
  String? name;
  String? phone;

  ShipperUser({this.id, this.name, this.phone});

  ShipperUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class Courier {
  String? phone;
  String? firstName;
  String? lastName;
  String? vehicleNumber;

  Courier({this.phone, this.firstName, this.lastName, this.vehicleNumber});

  Courier.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    vehicleNumber = json['vehicle_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['vehicle_number'] = this.vehicleNumber;
    return data;
  }
}

class Steps {
  String? id;
  String? branchName;
  ToLocation? location;
  String? address;
  String? destinationAddress;
  String? phoneNumber;
  List<OrdersProducts> products = [];
  String? description;
  String? orderNo;
  String? status;
  int? stepAmount;
  dynamic externalStepId;
  String? branchId;

  Steps({
    this.id,
    this.branchName,
    this.location,
    this.address,
    this.destinationAddress,
    this.phoneNumber,
    this.products = const [],
    this.description,
    this.orderNo,
    this.status,
    this.stepAmount,
    this.externalStepId,
    this.branchId,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
    location = json['location'] != null
        ? new ToLocation.fromJson(json['location'])
        : null;
    address = json['address'];
    destinationAddress = json['destination_address'];
    phoneNumber = json['phone_number'];
    products = <OrdersProducts>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(OrdersProducts.fromJson(v));
      });
    }
    description = json['description'];
    orderNo = json['order_no'];
    status = json['status'];
    stepAmount = json['step_amount'];
    externalStepId = json['external_step_id'];
    branchId = json['branch_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['description'] = this.description;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrdersProducts {
  String? id;
  String? name;
  num? quantity;
  dynamic price;
  int? totalAmount;
  String? productId;
  String? externalProductId;
  String? description;

  OrdersProducts({
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.totalAmount,
    this.productId,
    this.externalProductId,
    this.description,
  });

  OrdersProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    totalAmount = json['total_amount'];
    productId = json['product_id'];
    externalProductId = json['external_product_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['description'] = this.description;
    data['price'] = this.price;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
