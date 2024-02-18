import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
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

  String formatPay(double price) {
    final String formattedAmount = price
        .toStringAsFixed(2)
        .replaceAll(RegExp(r"([.]*00)(?!.*\d)"), "")
        .toString();
    return formattedAmount;
  }

  String formatDateNeed(String dateString) {
    print(orderModel.toJson());
    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    final String formattedDate = formatter.format(date.toLocal());
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ID заказа ${orderModel.id.toString()}'),
              _orderStatus(orderModel.status, context),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Адрес доставки:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Text(
                '${orderModel.city}, ${orderModel.address_1}',
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Часы работы:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Text(
                '11:00 - 21:00',
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Дата заказа:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Text(
                formatDateNeed(orderModel.createdAt),
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${orderModel.orderQuantity} товара',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${formatPay(double.parse(orderModel.totalPrice))} ${context.tr('uzs')}',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итого:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${formatPay(double.parse(orderModel.totalPrice))} ${context.tr('uzs')}',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  )
                ],
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
                Row(
                  children: [
                    Text(
                      context.tr('details'),
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

  Widget _orderStatus(String status, BuildContext context) {
    Icon icon;
    Color color;
    String statusRus;
    if (status == "pending" || status == "processing" || status == "on-hold") {
      icon = Icon(
        Icons.timer,
        color: Colors.orange,
        size: 15,
      );
      color = Colors.orange;
      statusRus = context.tr('processing');
    } else if (status == "completed") {
      icon = Icon(
        Icons.check,
        color: Colors.green,
        size: 15,
      );
      color = Colors.green;
      statusRus = context.tr('done');
    } else if (status == "cancelled" ||
        status == "refunded" ||
        status == "failed") {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
        size: 15,
      );
      color = Colors.redAccent;
      statusRus = context.tr('notdone');
    } else {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
        size: 15,
      );
      color = Colors.redAccent;
      statusRus = context.tr('notdone');
    }
    return iconText(
        icon,
        Text(
          statusRus,
          style: TextStyle(
              fontSize: 12, color: color, fontWeight: FontWeight.bold),
        ));
  }
}
