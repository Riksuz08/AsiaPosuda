import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/orderData/order_model.dart';

class OrderDetailsPage extends StatefulWidget {
  final OrderModel orderModel;
  const OrderDetailsPage({super.key, required this.orderModel});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  List<LineItems> lineitems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.orderModel.lineItems.id);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("#" + widget.orderModel.id.toString()),
              Text(widget.orderModel.createdAt),
              Text('Статус: ' + widget.orderModel.status),
              // ListView.builder(
              //   itemCount: widget.orderModel.lineItems.length,
              //   itemBuilder: (context, index) => ListTile(
              //     title: Text(widget.orderModel.lineItems[index].name),
              //   ),
              // )
            ],
          ),
        ),
      );
}
