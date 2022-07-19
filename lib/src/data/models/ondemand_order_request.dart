import 'orders_response.dart';

enum PaymentType {
  cash,
  click,
  payme,
}

enum DeliveryType {
  delivery,
  self_pickup,
}


enum DeliveryTime {
  fastDelivery,
  scheduledDelivery,
}

class OnDemandOrderRequest {
  String? aggregatorId;
  String? apartment;
  String? building;
  String? clientId;
  int? coDeliveryPrice;
  String? deliveryTime;
  String? deliveryType;
  String? description;
  String? extraPhoneNumber;
  String? floor;
  bool? paid;
  String? paymentType;
  String? source;
  String? statusId;
  List<Steps> steps =  [];
  String? toAddress;
  bool? isCourierCall;
  ToLocation? toLocation;
  String? futureTime;

  OnDemandOrderRequest({
    this.aggregatorId,
    this.apartment,
    this.building,
    this.clientId,
    this.coDeliveryPrice,
    this.deliveryTime,
    this.deliveryType,
    this.description,
    this.extraPhoneNumber,
    this.floor,
    this.paid,
    this.isCourierCall,
    this.paymentType,
    this.source,
    this.statusId,
    this.steps = const [],
    this.toAddress,
    this.toLocation,
    this.futureTime,
  });

  OnDemandOrderRequest.fromJson(Map<String, dynamic> json) {
    // apartment = json['aggregator_id'];
    apartment = json['apartment'];
    building = json['building'];
    clientId = json['client_id'];
    coDeliveryPrice = json['co_delivery_price'];
    deliveryTime = json['delivery_time'];
    deliveryType = json['delivery_type'];
    description = json['description'];
    isCourierCall = json['is_courier_call'];
    extraPhoneNumber = json['extra_phone_number'];
    floor = json['floor'];
    paid = json['paid'];
    paymentType = json['payment_type'];
    source = json['source'];
    statusId = json['status_id'];
    steps = <Steps>[];
    if (json['steps'] != null) {
      json['steps'].forEach((v) {
        steps.add(Steps.fromJson(v));
      });
    }
    toAddress = json['to_address'];
    toLocation = json['to_location'] != null
        ? ToLocation.fromJson(json['to_location'])
        : null;
    futureTime = json['future_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['aggregator_id'] = this.aggregatorId;
    data['apartment'] = this.apartment;
    data['building'] = this.building;
    data['client_id'] = this.clientId;
    data['co_delivery_price'] = this.coDeliveryPrice;
    data['delivery_time'] = this.deliveryTime;
    data['delivery_type'] = this.deliveryType;
    data['description'] = this.description;
    data['is_courier_call'] = this.isCourierCall;
    data['extra_phone_number'] = this.extraPhoneNumber;
    data['floor'] = this.floor;
    data['paid'] = this.paid;
    data['payment_type'] = this.paymentType;
    data['source'] = this.source;
    data['status_id'] = this.statusId;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    data['to_address'] = this.toAddress;
    if (this.toLocation != null) {
      data['to_location'] = this.toLocation?.toJson();
    }
    data['future_time'] = this.futureTime;

    return data;
  }
}

// class Steps {
//   String branchId;
//   String description;
//   List<OrderProducts> products;
//
//   Steps({this.branchId, this.description, this.products});
//
//   Steps.fromJson(Map<String, dynamic> json) {
//     branchId = json['branch_id'];
//     description = json['description'];
//     products = <OrderProducts>[];
//     if (json['products'] != null) {
//       json['products'].forEach((v) {
//         products.add(OrderProducts.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['branch_id'] = this.branchId;
//     data['description'] = this.description;
//     if (this.products != null) {
//       data['products'] = this.products.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class OrderProducts {
//   String description;
//   String price;
//   String productId;
//   int quantity;
//
//   OrderProducts({this.description, this.price, this.productId, this.quantity});
//
//   OrderProducts.fromJson(Map<String, dynamic> json) {
//     description = json['description'];
//     price = json['price'];
//     productId = json['product_id'];
//     quantity = json['quantity'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['product_id'] = this.productId;
//     data['quantity'] = this.quantity;
//     return data;
//   }
// }
//
// class ToLocation {
//   double lat;
//   double long;
//
//   ToLocation({this.lat, this.long});
//
//   ToLocation.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     long = json['long'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     return data;
//   }
// }
