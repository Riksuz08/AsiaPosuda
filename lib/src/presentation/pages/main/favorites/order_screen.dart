import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberController.text = '+998';
  }

  bool first = true;
  int totalCheckedQuantity() {
    int checkedQ = 0;
    for (final item in order) {
      checkedQ += item.quantity;
    }
    return checkedQ;
  }

  String countryDropdown = 'Toshkent shahri';
  HttpService httpService = HttpService();
  int selectedValue = -1;
  int selectedValuePay = -1;
  String gettextDelivery() {
    if (selectedValue == 0) {
      return 'Можете забрать сегодня!';
    } else {
      return 'Доставим в течении 24 - 48 часов';
    }
  }

  String gettextFreeDeliveryText() {
    if (countryDropdown == 'Toshkent shahri') {
      return 'Бесплатная доставка от 300 000 сум!';
    } else {
      return 'Бесплатная доставка от 700 000 сум!';
    }
  }

  String getDelivery() {
    if (selectedValue == 0) {
      return 'Забрать с филиалов';
    } else if (selectedValue == 1) {
      return 'Экспресс доставка';
    } else if (selectedValue == 2) {
      return 'Бесплатная доставка(П и Ч)';
    } else {
      return 'Бесплатная доставка';
    }
  }

  String getPay() {
    if (selectedValuePay == 0) {
      return 'Наличными';
    } else if (selectedValuePay == 1) {
      return 'Картой';
    } else {
      return 'Не выбрано';
    }
  }

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
            'Оформление заказа',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: ColoredBox(
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: widget.orderProducts.map((product) {
                                  // Use product.images.first to get the first image URL for each product
                                  final String imageUrl =
                                      product.images.isNotEmpty
                                          ? product.images.first
                                          : '';

                                  return Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        // Set the background color to grey
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Получатель заказа',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                              const SizedBox(
                                height: 0,
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
                                height: 0,
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
                                height: 0,
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
                                height: 0,
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
                          'Способ получения',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Город',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<String>(
                                value: countryDropdown,
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    countryDropdown = newValue!;
                                    print(countryDropdown);
                                  });
                                },
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'Andijon',
                                    child: Text('Andijon'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Buxoro',
                                    child: Text('Buxoro'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Farg\'ona',
                                    child: Text('Farg\'ona'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Jizzax',
                                    child: Text('Jizzax'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Xorazm',
                                    child: Text('Xorazm'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Namangan',
                                    child: Text('Namangan'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Navoiy',
                                    child: Text('Navoiy'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Qashqadaryo',
                                    child: Text('Qashqadaryo'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Qoraqalpog\'iston',
                                    child: Text('Qoraqalpog\'iston'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Samarqand',
                                    child: Text('Samarqand'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Sirdaryo',
                                    child: Text('Sirdaryo'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Surxondaryo',
                                    child: Text('Surxondaryo'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Toshkent shahri',
                                    child: Text('Toshkent shahri'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Toshkent viloyati',
                                    child: Text('Toshkent viloyati'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                        SizedBox(height: 5),
                        if (countryDropdown == 'Toshkent shahri' &&
                            widget.totalPrice < 300000)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Выберите способ доставки',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              _buildForShahar(),
                            ],
                          ),
                        if (countryDropdown == 'Toshkent shahri' &&
                            widget.totalPrice > 300000)
                          _buildFreeDelivery(),
                        if (countryDropdown != 'Toshkent shahri' &&
                            widget.totalPrice < 700000)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Выберите способ доставки',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              _buildForViloyat(),
                            ],
                          ),
                        if (countryDropdown != 'Toshkent shahri' &&
                            widget.totalPrice > 700000)
                          _buildFreeDelivery()
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
                              'Способ оплаты',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _buildPay()
                          ]))),
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
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey.shade200,
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: Center(
                          //       child: Padding(
                          //     padding: EdgeInsets.symmetric(vertical: 10),
                          //     child: Text(gettextDelivery()),
                          //   )),
                          // ),
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
                                if (selectedValue != -1 &&
                                    selectedValuePay != -1) {
                                  if (addressController.text != '') {
                                    if (first) {
                                      first = false;
                                      Center(
                                        child: CircularProgressIndicator(),
                                      );
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
                                              widget.totalPrice.toString(),
                                              countryDropdown,
                                              getPay(),
                                              getDelivery());

                                      if (orderModel != null) {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SuccessfullyOrdered(
                                                      orderModel: orderModel,
                                                      address: addressController
                                                          .text,
                                                      methodPay: getPay(),
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
                                          FavoritesPage.orderProducts
                                              .remove(item);
                                        }
                                      }
                                      FavoritesPage.checkedProducts.clear();
                                    }
                                  } else {
                                    showOptionSnackBar(context,
                                        'Поля адресс доставки пустой!');
                                  }
                                } else {
                                  showOptionSnackBar(context,
                                      'Выберите способ доставки и оплаты');
                                }
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

  Widget _buildForShahar() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioListTile<int>(
            value: 0,
            groupValue: selectedValue,
            onChanged: (int? value) {
              setState(() {
                selectedValue = value!;
                print(selectedValue);
              });
            },
            title: Text(
              'Забрать с филиалов',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Посмотреть где!',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioListTile<int>(
            value: 1,
            groupValue: selectedValue,
            onChanged: (int? value) {
              setState(() {
                selectedValue = value!;
                print(selectedValue);
              });
            },
            title: Text(
              'Экспресс доставка',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'От 30 000 сум',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioListTile<int>(
            value: 2,
            groupValue: selectedValue,
            onChanged: (int? value) {
              setState(() {
                selectedValue = value!;
                print(selectedValue);
              });
            },
            title: Text(
              'Бесплатная доставка',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Понядельник, Четверг',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForViloyat() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioListTile<int>(
            value: 0,
            groupValue: selectedValue,
            onChanged: (int? value) {
              setState(() {
                selectedValue = value!;
                print(selectedValue);
              });
            },
            title: Text(
              'Доставка через фарго',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'От 25 000 сум',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioListTile<int>(
            value: 1,
            groupValue: selectedValue,
            onChanged: (int? value) {
              setState(() {
                selectedValue = value!;
                print(selectedValue);
              });
            },
            title: Text(
              'Экспресс доставка',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Оператов свяжтся с вами чтобы обсудить!',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFreeDelivery() {
    selectedValue = 10;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF79B531),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'У вас бесплатная доставка',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              gettextFreeDeliveryText(),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPay() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioListTile<int>(
            value: 0,
            groupValue: selectedValuePay,
            onChanged: (int? value) {
              setState(() {
                selectedValuePay = value!;
                print(selectedValuePay);
              });
            },
            title: Text(
              'Наличными при получении',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Оплата в пункте выдачи или курьеру при получении заказа',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioListTile<int>(
            value: 1,
            groupValue: selectedValuePay,
            onChanged: (int? value) {
              setState(() {
                selectedValuePay = value!;
                print(selectedValuePay);
              });
            },
            title: Text(
              'Картой при получении',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Оплата в пункте выдачи или курьеру при получении заказа',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showOptionSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: RichText(
          text: TextSpan(
            text: message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF79B531),
      ),
    );
  }
}
