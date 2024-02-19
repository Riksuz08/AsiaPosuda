import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/HomeController.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/order_provider.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/widget_order_item.dart';

import '../../../../config/config.dart';
import '../../../../data/models/orderData/order_model.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.grey.shade50,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            context.tr('my_orders'),
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Активные',
              ),
              Tab(
                text: 'Все',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Consumer<OrderProvider>(builder: (context, orderModels, child) {
              print(orderModels.allOrders);
              final List<OrderModel> activeOrders = orderModels.allOrders
                  .where((order) =>
                      order.status == 'processing' ||
                      order.status == 'on-hold' ||
                      order.status == 'pending')
                  .toList();
              if (activeOrders.length > 0) {
                return _activeOrders(context, orderModels.allOrders);
              } else {
                return Center(
                  child: Text('Нету активных заказов'),
                );
              }
            }),
            Consumer<OrderProvider>(builder: (context, orderModels, child) {
              print(orderModels.allOrders);
              if (orderModels.allOrders.length > 0) {
                return _allOrders(context, orderModels.allOrders);
              } else {
                return Center(
                  child: Text('Нету заказов'),
                );
              }
            }),
          ],
        ),
      ));

  Widget _activeOrders(BuildContext context, List<OrderModel> orders) {
    final List<OrderModel> activeOrders = orders
        .where((order) =>
            order.status == 'processing' ||
            order.status == 'on-hold' ||
            order.status == 'pending')
        .toList();

    return ListView(
      children: [
        ListView.builder(
          itemCount: activeOrders.length,
          physics: ScrollPhysics(),
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: WidgetOrderItem(
                orderModel: activeOrders[index],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _allOrders(BuildContext context, List<OrderModel> orders) => ListView(
        children: [
          ListView.builder(
            itemCount: orders.length,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(16)),
                child: WidgetOrderItem(
                  orderModel: orders[index],
                ),
              );
            },
          )
        ],
      );
}
