import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import '../../../../data/models/orderData/order_model.dart';

class OrderDetailsPage extends StatefulWidget {
  final OrderModel orderModel;
  const OrderDetailsPage({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  String formatDate(String dateString) {
    print(widget.orderModel.toJson());
    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('dd MMM, yyyy + hh:mm a');
    final String formattedDate = formatter.format(date.toLocal());
    final String dateneed = formattedDate.replaceAll('+', 'в');
    return dateneed;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Заказ',
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 15,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Номер заказа: ' +
                            '#' +
                            widget.orderModel.id.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  _text(widget.orderModel.status, context),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(formatDate(widget.orderModel.createdAt)),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Купленные товары',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true, // Important to set shrinkWrap to true
                  physics:
                      NeverScrollableScrollPhysics(), // To disable ListView's scrolling
                  itemCount: widget.orderModel.lineItems.length,
                  itemBuilder: (context, index) => Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    widget.orderModel.lineItems[index].name,
                                    maxLines:
                                        2, // Set the maximum number of lines
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(widget.orderModel.lineItems[index].total +
                                    ' ' +
                                    context.tr('uzs'))
                              ],
                            ),
                            Text(widget.orderModel.lineItems[index].price
                                    .toString() +
                                ' сум, x' +
                                widget.orderModel.lineItems[index].quantity
                                    .toString())
                          ],
                        ),
                      )),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Общая сумма ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(widget.orderModel.totalPrice + ' ' + context.tr('uzs')),
                ],
              )
            ],
          ),
        ),
      );

  Widget _text(String status, BuildContext context) {
    Color color;
    String statusRus;
    if (status == 'pending' || status == 'processing' || status == 'on-hold') {
      color = Colors.orange;
      statusRus = context.tr('processing2');
    } else if (status == 'completed') {
      color = Colors.green;
      statusRus = context.tr('done2');
    } else if (status == 'cancelled' ||
        status == 'refunded' ||
        status == 'failed') {
      color = Colors.redAccent;
      statusRus = context.tr('notdone2');
    } else {
      color = Colors.redAccent;
      statusRus = context.tr('notdone2');
    }
    return Text(
      statusRus.toUpperCase(),
      style: TextStyle(color: color),
    );
  }
}
