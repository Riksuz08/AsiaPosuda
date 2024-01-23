import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';

import '../../../../config/config.dart';
import '../../../../data/models/orderData/order_model.dart';

class OrderProvider with ChangeNotifier {
  late HttpService httpService;
  final List<OrderModel> _orderList = [];

  List<OrderModel> get allOrders => _orderList;
  double get totalRecords => _orderList.length.toDouble();

  OrderProvider() {
    resetStreams();
  }

  void resetStreams() {
    httpService = HttpService();
  }

  Future<void> fetchOrders() async {
    try {
      final List<OrderModel> orderList =
          await httpService.getOrdersOfUser(Config.id);

      _orderList.clear();
      _orderList.addAll(orderList);

      notifyListeners();
    } catch (error) {
      // Handle error if needed
      print('Error fetching orders: $error');
    }
  }
}
