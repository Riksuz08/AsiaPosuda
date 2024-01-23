class OrderModel {
  late int id;
  late String createdAt;
  late String status;
  late String totalPrice;
  late int orderQuantity;
  late LineItems lineItems;

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.status,
    required this.totalPrice,
    required this.orderQuantity,
    required this.lineItems,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt,
        'status': status,
        'total_price': totalPrice,
        'order_quantity': orderQuantity,
        'line_items': lineItems.toJson(),
      };
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final List<LineItems> lineItemsJson = json['line_items'];
    return OrderModel(
      id: json['id'],
      createdAt: json['created_at'],
      status: json['status'],
      totalPrice: json['total'],
      orderQuantity: json['total_line_items_quantity'],
      lineItems: LineItems.fromJsonList(
        json['line_items'] is List
            ? json['line_items'][0] // Assuming you want the first item
            : json['line_items'],
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
  factory LineItems.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      // Assuming you want to handle the first item in the list
      final Map<String, dynamic> firstItem = jsonList[0];
      return LineItems(
        id: firstItem['id'],
        total: firstItem['total'],
        price: firstItem['price'],
        quantity: firstItem['quantity'],
        name: firstItem['name'],
        productId: firstItem['product_id'],
      );
    } else {
      // Handle the case where the list is empty (if needed)
      return LineItems(
        id: 0,
        total: '0.00',
        price: '0.00',
        quantity: 0,
        name: '',
        productId: 0,
      );
    }
  }
}
