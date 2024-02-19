import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/reviewed_item.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/widget_order_item.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/widget_review_item.dart';

import '../../../../data/models/orderData/order_model.dart';
import 'order_provider.dart';

class MyReviews extends StatefulWidget {
  const MyReviews({super.key});

  @override
  State<MyReviews> createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);
    orderProvider.fetchOrders();
    print(orderProvider.allOrders);
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.grey.shade50,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            context.tr('my_reviews'),
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Ждут оценки',
              ),
              Tab(
                text: 'Оставленные',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Consumer<OrderProvider>(builder: (context, orderModels, child) {
              print(orderModels.allOrders);
              if (orderModels.allOrders.length > 0) {
                return _completeOrders(context, orderModels.allOrders);
              } else {
                return Center(
                  child: Text('Пусто'),
                );
              }
            }),
            Consumer<OrderProvider>(builder: (context, orderModels, child) {
              print(orderModels.allOrders);
              if (orderModels.allOrders.length > 0) {
                return _completeOrdersReviewed(context, orderModels.allOrders);
              } else {
                return Center(
                  child: Text('Пусто'),
                );
              }
            }),
          ],
        ),
      ));

  Widget _completeOrders(BuildContext context, List<OrderModel> orders) {
    final List<OrderModel> activeOrders =
        orders.where((order) => order.status == 'completed').toList();

    return ReviewItemList(
      orderModels: activeOrders,
    );
  }

  Widget _completeOrdersReviewed(
      BuildContext context, List<OrderModel> orders) {
    final List<OrderModel> activeOrders =
        orders.where((order) => order.status == 'completed').toList();

    return ReviewedItemList(
      orderModels: activeOrders,
    );
  }
}
