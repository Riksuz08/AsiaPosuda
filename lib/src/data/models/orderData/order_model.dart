class OrderModel {
  late int id;
  late String createdAt;
  late String status;
  late String city;
  late String address_1;
  late String totalPrice;
  late int orderQuantity;
  late List<LineItems> lineItems;

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.status,
    required this.city,
    required this.address_1,
    required this.totalPrice,
    required this.orderQuantity,
    required this.lineItems,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt,
        'status': status,
        'city': city,
        'address_1': address_1,
        'total_price': totalPrice,
        'order_quantity': orderQuantity,
        'line_items': lineItems.map((item) => item.toJson()).toList(),
      };

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> lineItemsJson = json['line_items'];
    return OrderModel(
      id: json['id'],
      createdAt: json['created_at'],
      status: json['status'],
      totalPrice: json['total'],
      city: json['shipping_address']['city'],
      address_1: json['shipping_address']['address_1'],
      orderQuantity: json['total_line_items_quantity'],
      lineItems: List<LineItems>.from(
        lineItemsJson.map((item) => LineItems.fromJson(item)),
      ),
    );
  }
}

class LineItems {
  int id;
  String total;
  String price;
  int quantity;
  String name;
  int productId;

  LineItems({
    required this.id,
    required this.total,
    required this.price,
    required this.quantity,
    required this.name,
    required this.productId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'total': total,
        'price': price,
        'quantity': quantity,
        'name': name,
        'product_id': productId,
      };

  factory LineItems.fromJson(Map<String, dynamic> json) => LineItems(
        id: json['id'],
        total: json['total'],
        price: json['price'],
        quantity: json['quantity'],
        name: json['name'],
        productId: json['product_id'],
      );
}
