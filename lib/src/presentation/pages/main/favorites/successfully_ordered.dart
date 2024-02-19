import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/models/orderData/order_model.dart';

class SuccessfullyOrdered extends StatefulWidget {
  final OrderModel orderModel;
  final String address;
  final String methodPay;
  const SuccessfullyOrdered(
      {super.key,
      required this.orderModel,
      required this.address,
      required this.methodPay});

  @override
  State<SuccessfullyOrdered> createState() => _SuccessfullyOrderedState();
}

class _SuccessfullyOrderedState extends State<SuccessfullyOrdered> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey.shade700,
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreen,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )),
                    Text(
                      'Заказ принят',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Заказ № ${widget.orderModel.id.toString()} оформлен. В день доставки оператор свяжется с вами',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Column(
                        children: [
                          Text(
                            'Адресс доставки',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Text(
                            widget.address,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Метод оплаты',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Text(
                            widget.methodPay,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Часы работы',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Text(
                            '11:00 - 21:00',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      )));
}
