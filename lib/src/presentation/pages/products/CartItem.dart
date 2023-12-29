import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';

import '../main/favorites/Product.dart';

class CartItem {

  CartItem({
    required this.productId,
    required this.productName,
    required this.imageUrl,
    required this.price,

    required this.quantity,
  });

  // factory CartItem.fromMap(Map<String, dynamic> map) => CartItem(
  //     productId: map['productId'] ?? 0,
  //     // productName: map['productName'] ?? '',
  //     // imageUrl: map['imageUrl'] ?? 'https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png',
  //     // price: map['price']?.toString() ?? '',
  //   // Convert double to String
  //   product: ,
  //     quantity: map['quantity'] ?? 0,
  //   );
  final int productId;
  final String productName;
  final String imageUrl;
  final String price;

  int quantity;

  Map<String, dynamic> toMap() => {
      'productId': productId,
      'productName': productName,
      'imageUrl': imageUrl,
      'price':price,
      'quantity': quantity,
    };
  factory CartItem.fromMap(Map<String, dynamic> map) => CartItem(
      productId: map['id'],
      productName: map['productName'],
      imageUrl: map['imageUrl'],
      price: map['price'].toString(),
      quantity: map['quantity'],
    );

}
