import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:sample_bloc_mobile/src/data/models/orderData/order_model.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/favorites/bookmark_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/favorites/successfully_ordered.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/config.dart';
import '../../../../data/models/products/products_data.dart';
import 'order_provider.dart';

class OrderScreen extends StatefulWidget {
  final double totalPrice;
  final List<ProductItem> orderProducts;
  const OrderScreen(
      {super.key, required this.totalPrice, required this.orderProducts});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  static List<ProductItem> order = FavoritesPage.checkedProducts;
  int totalCheckedQuantity() {
    int checkedQ = 0;
    for (final item in order) {
      checkedQ += item.quantity;
    }
    return checkedQ;
  }

  HttpService httpService = HttpService();
  String gettextDelivery() {
    if (selectedValue) {
      return 'Можете забрать сегодня!';
    } else {
      return 'Доставим в течении 24 - 48 часов';
    }
  }

  bool selectedValue = false;
  String formatNumber(int number) {
    final String reversed = number.toString().split('').reversed.join();
    String result = '';

    for (int i = 0; i < reversed.length; i++) {
      result += reversed[i];
      if ((i + 1) % 3 == 0 && i + 1 < reversed.length) {
        result += ' ';
      }
    }

    return result.split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    String message;

    if (totalCheckedQuantity() == 1) {
      message =
          "${totalCheckedQuantity().toString()} товар на сумму ${formatNumber(widget.totalPrice.round())}";
    } else if (totalCheckedQuantity() >= 2 && totalCheckedQuantity() <= 4) {
      message =
          "${totalCheckedQuantity().toString()} товара на сумму ${formatNumber(widget.totalPrice.round())}";
    } else {
      message =
          "${totalCheckedQuantity().toString()} товаров на сумму ${formatNumber(widget.totalPrice.round())}";
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Оформление товара',
            style: TextStyle(fontSize: 16),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: ColoredBox(
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Text(
                    message,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Способ получения',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Выберите способ доставки',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 5),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedValue = true;
                                  if (selectedValue) {
                                    print('1');
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: true,
                                      groupValue: selectedValue,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedValue = value!;
                                          if (selectedValue) {
                                            print('1');
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Забрать с филиалов',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'Можно забрать сегодня!',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedValue = false;
                                  if (!selectedValue) {
                                    print('2');
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: true,
                                      groupValue: !selectedValue,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedValue = !value!;
                                          if (!selectedValue) {
                                            print('2');
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Экспресс доставка',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'Ознакомьтесь с правилами доставки!',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 12,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Получатель заказа',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: 'Имя',
                                  alignLabelWithHint: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextField(
                                controller: surnameController,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Фамилия',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextField(
                                controller: addressController,
                                decoration: InputDecoration(
                                  labelText: 'Адресс доставки',
                                  alignLabelWithHint: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextField(
                                controller: numberController,
                                decoration: InputDecoration(
                                  labelText: 'Номер',
                                  alignLabelWithHint: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'В формате +998__ _______',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Мы пришлем уведомление о статусе заказа на указанный вами телефон.Курьер свяжется с вами по телефону для уточнения времени доставки.',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ваш заказ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(gettextDelivery()),
                            )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Итого',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                formatNumber(widget.totalPrice.round())
                                        .toString() +
                                    ' ' +
                                    context.tr('uzs'),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final OrderModel? orderModel =
                                    await httpService.orderProducts(
                                        widget.orderProducts,
                                        Config.nameUser.toString(),
                                        Config.nameUser.toString(),
                                        Config.email,
                                        Config.phoneUser.toString(),
                                        int.parse(Config.id),
                                        addressController.text.trim(),
                                        nameController.text.trim(),
                                        surnameController.text.trim(),
                                        numberController.text.trim(),
                                        widget.totalPrice.toString());

                                if (orderModel != null) {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SuccessfullyOrdered(
                                                orderModel: orderModel,
                                              )));
                                  Navigator.pop(context);
                                  print(true);
                                } else {
                                  print(false);
                                }
                                for (final item
                                    in FavoritesPage.checkedProducts) {
                                  if (FavoritesPage.orderProducts
                                      .contains(item)) {
                                    FavoritesPage.orderProducts.remove(item);
                                  }
                                }
                                FavoritesPage.checkedProducts.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF79B531),
                              ),
                              child: Text(
                                context.tr('order'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}
