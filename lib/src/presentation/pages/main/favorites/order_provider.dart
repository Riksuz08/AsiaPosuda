import 'package:flutter/material.dart';

import '../../../../data/models/orderData/order_model.dart';

class OrderModelProvider with ChangeNotifier {
  OrderModel? _orderModel;

  OrderModel? get orderModel => _orderModel;

  void setOrderModel(OrderModel orderModel) {
    _orderModel = orderModel;
    notifyListeners();
  }
}
