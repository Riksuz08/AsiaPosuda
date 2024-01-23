import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/models/products/products_data.dart';
import '../../../bloc/main/main_bloc.dart';
import '../../products/product_details.dart';
import 'order_provider.dart';
import 'order_screen.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static RxList<ProductItem> orderProducts = RxList<ProductItem>();
  static List<ProductItem> checkedProducts = [];

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int totalPrice = 0;
  int totalPriceX = 0;
  int totalProducts = 0;
  int totalProductsX = 0;

  void totalPrices() {
    totalPriceX = 0;
    totalProductsX = 0;
    final product = FavoritesPage.orderProducts;
    for (final pr in product) {
      totalPriceX += int.parse(pr.price) * pr.quantity;
      totalProductsX += pr.quantity;
    }
    totalPrice = 0;
    totalProducts = 0;
    totalPrice = totalPriceX;
    totalProducts = totalProductsX;
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

  bool checkAll = true;
  Future<void> _launchURLInBrowser() async {
    final url = Uri.parse('https://asiaposuda.uz/dostavka/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      totalPrices();
    });
  }

  double totalCheckedPrice() {
    double checkedPrice = 0;
    for (final item in FavoritesPage.checkedProducts) {
      checkedPrice += item.quantity * int.parse(item.price);
    }
    print(checkedPrice);
    return checkedPrice;
  }

  int totalCheckedQuantity() {
    int checkedQ = 0;
    for (final item in FavoritesPage.checkedProducts) {
      checkedQ += item.quantity;
    }
    print(checkedQ);
    return checkedQ;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            context.tr('cart'),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Obx(() {
          if (FavoritesPage.orderProducts.isEmpty) {
            return ColoredBox(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/png/empty_cart.jpg',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Время покупок !',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<MainBloc>()
                            .add(const MainEventChanged(BottomMenu.main));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF79B531),
                      ),
                      child: Text(
                        context.tr('main_to'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            totalPrices();
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.13),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: FavoritesPage.orderProducts.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            // Add your fixed container here
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: _launchURLInBrowser,
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Lottie.network(
                                              'https://lottie.host/d0ba0ef0-cf1e-4fa9-9ba4-f48719c429ec/InLcb3pvJ8.json',
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'Есть сервис доставки!',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text('Подробнее')
                                              ],
                                            )
                                          ],
                                        ),
                                        // Your fixed content goes here
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (FavoritesPage
                                                .checkedProducts.isEmpty) {
                                              return;
                                            }
                                            for (final item in FavoritesPage
                                                .checkedProducts) {
                                              if (FavoritesPage.orderProducts
                                                  .contains(item)) {
                                                FavoritesPage.orderProducts
                                                    .remove(item);
                                              }
                                            }
                                            FavoritesPage.checkedProducts
                                                .clear();
                                            print(FavoritesPage
                                                .orderProducts.length);
                                            print(FavoritesPage
                                                .checkedProducts.length);
                                          },
                                          child: Text(
                                            'Удалить выбранные',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: FavoritesPage
                                                        .checkedProducts
                                                        .isNotEmpty
                                                    ? Colors.black
                                                    : Colors.grey.shade500),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Выбрать все',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.grey.shade300,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              value: checkAll,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  if (checkAll == true) {
                                                    checkAll = !checkAll;
                                                    FavoritesPage
                                                        .checkedProducts
                                                        .clear();
                                                    print(FavoritesPage
                                                        .checkedProducts);
                                                  } else {
                                                    print(checkAll);
                                                    checkAll = !checkAll;
                                                    FavoritesPage
                                                        .checkedProducts
                                                        .addAll(FavoritesPage
                                                            .orderProducts);
                                                    print(FavoritesPage
                                                        .checkedProducts);
                                                  }
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              width: 8,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          }

                          final product =
                              FavoritesPage.orderProducts[index - 1];
                          final int count = product.quantity;
                          final bool isChecked =
                              FavoritesPage.checkedProducts.contains(product);

                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetails(product: product),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: CachedNetworkImage(
                                          height: 120,
                                          width: 70,
                                          imageUrl: (product.images.isNotEmpty)
                                              ? product.images.first
                                              : 'https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png',
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              Container(
                                            color: Colors.grey.shade300,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                            child: Icon(
                                              Icons.error_outline,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${formatNumber(int.parse(product.price))} сум'),
                                          Checkbox(
                                            checkColor: Colors.black,
                                            activeColor: Colors.grey.shade300,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                if (value == true) {
                                                  FavoritesPage.checkedProducts
                                                      .add(product);
                                                  print(FavoritesPage
                                                      .checkedProducts);
                                                } else {
                                                  FavoritesPage.checkedProducts
                                                      .remove(product);
                                                  print(FavoritesPage
                                                      .checkedProducts);
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            style: const TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 35,
                                            width: 100,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade200,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Colors.white),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (count > 1) {
                                                          product.quantity--;
                                                        } else {
                                                          FavoritesPage
                                                              .orderProducts
                                                              .remove(product);
                                                          FavoritesPage
                                                              .checkedProducts
                                                              .remove(product);
                                                        }
                                                        totalPrices();
                                                      });
                                                    },
                                                    child: const Icon(
                                                        Icons.remove),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Text(
                                                    '$count',
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Container(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        product.quantity++;
                                                        totalPrices();
                                                      });
                                                    },
                                                    child:
                                                        const Icon(Icons.add),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        height: 0.1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 12),
                              //   child: ColoredBox(
                              //     color: Colors.white,
                              //     child: Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         Text(
                              //           'Ваш заказ',
                              //           style: TextStyle(
                              //               fontSize: 18,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //         SizedBox(
                              //           height: 10,
                              //         ),
                              //         // Row(
                              //         //
                              //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //         //   children: [
                              //         //     Text('Товаров: ${totalCheckedQuantity()}',style: TextStyle(color: Colors.grey),),
                              //         //     Text(formatNumber(totalCheckedPrice().round())+' '+context.tr('uzs'),style: TextStyle(color: Colors.grey),)
                              //         //   ],
                              //         // ),
                              //         SizedBox(
                              //           height: 10,
                              //         ),
                              //         Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Text(
                              //               'Итого',
                              //               style:
                              //                   TextStyle(color: Colors.grey),
                              //             ),
                              //             Text(
                              //               formatNumber(totalCheckedPrice()
                              //                       .round()) +
                              //                   ' ' +
                              //                   context.tr('uzs'),
                              //               style: TextStyle(
                              //                   fontSize: 18,
                              //                   fontWeight: FontWeight.w500),
                              //             )
                              //           ],
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${formatNumber(totalCheckedPrice().round())} ' +
                                      context.tr('uzs'),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  context.tr('products') +
                                      ": " +
                                      totalCheckedQuantity().toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderScreen(
                                                totalPrice: totalCheckedPrice(),
                                                orderProducts: FavoritesPage
                                                    .checkedProducts,
                                              )));
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      );
}
