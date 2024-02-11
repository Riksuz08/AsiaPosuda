import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_bloc_mobile/src/data/models/orderData/order_model.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/order_details.dart';

class WidgetOrderItem extends StatelessWidget {
  final OrderModel orderModel;
  const WidgetOrderItem({super.key, required this.orderModel});
  String formatDate(String dateString) {
    print(orderModel.toJson());
    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('dd MMM, yyyy');
    final String formattedDate = formatter.format(date.toLocal());
    final String dateneed = formattedDate.replaceAll('+', 'в');
    return dateneed;
  }

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _orderStatus(orderModel.status),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                  Icon(
                    Icons.edit,
                    size: 18,
                  ),
                  Text(
                    'Номер заказа',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
              Text(
                orderModel.id.toString(),
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                  Icon(
                    Icons.today,
                    size: 18,
                  ),
                  Text(
                    'Время заказа',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
              Text(
                formatDate(orderModel.createdAt),
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              flatButton(
                const Row(
                  children: [
                    Text(
                      ' Детали ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
                Color(0xFF79B531),
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailsPage(
                                orderModel: orderModel,
                              )));
                },
              )
            ],
          )
        ],
      ));

  Widget iconText(Icon iconWidget, Text textWidget) => Row(
        children: [
          iconWidget,
          SizedBox(
            width: 5,
          ),
          textWidget
        ],
      );
  Widget flatButton(Widget iconText, Color color, VoidCallback onPressed) =>
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color, // Set your desired color here
        ),
        child: iconText,
      );

  Widget _orderStatus(String status) {
    Icon icon;
    Color color;
    if (status == "pending" || status == "processing" || status == "on-hold") {
      icon = Icon(
        Icons.timer,
        color: Colors.orange,
      );
      color = Colors.orange;
    } else if (status == "completed") {
      icon = Icon(
        Icons.check,
        color: Colors.green,
      );
      color = Colors.green;
    } else if (status == "cancelled" ||
        status == "refunded" ||
        status == "failed") {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    } else {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    }
    return iconText(
        icon,
        Text(
          "Order $status",
          style: TextStyle(
              fontSize: 15, color: color, fontWeight: FontWeight.bold),
        ));
  }
}
