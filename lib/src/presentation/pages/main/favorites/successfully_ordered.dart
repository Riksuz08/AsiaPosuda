import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/models/orderData/order_model.dart';

class SuccessfullyOrdered extends StatefulWidget {
  final OrderModel orderModel;
  const SuccessfullyOrdered({super.key, required this.orderModel});

  @override
  State<SuccessfullyOrdered> createState() => _SuccessfullyOrderedState();
}

class _SuccessfullyOrderedState extends State<SuccessfullyOrdered> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
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
                      child: Text(
                        'Закрыть',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Lottie.network(
                          'https://lottie.host/5363f9eb-07b0-47b5-919a-5c369d954c73/5gpis4oikC.json',
                        ),
                        Text(
                          'Ваш заказ в обработке',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF79B531)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Номер заказа "),
                            Text(
                              widget.orderModel.id.toString(),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ))));
}
