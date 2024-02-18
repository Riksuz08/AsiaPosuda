import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/register/register_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/router/app_routes.dart';
import '../../../../config/slugs.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/http_service.dart';
import '../../../../data/models/products/products_data.dart';
import '../../../bloc/main/main_bloc.dart';
import '../../products/components/product_card.dart';
import '../../products/product_details.dart';
import 'order_provider.dart';
import 'order_screen.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static RxList<ProductItem> orderProducts = RxList<ProductItem>();
  static List<ProductItem> checkedProducts = [];
  static String category = 'Vazalar vqa shamdonlar';
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int totalPrice = 0;
  int totalPriceX = 0;
  int totalProducts = 0;
  int totalProductsX = 0;
  late RxList productsCategory = [].obs;
  Future<void> _fetchCategoryProducts() async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        getSlugByName(FavoritesPage.category),
        1,
      );
      setState(() {
        productsCategory = products.obs;
      });
      print(productsCategory);
    } on (Error,) {
      throw 'Error';
    }
  }

  void totalPrices() {
    print(FavoritesPage.category);
    _fetchCategoryProducts();
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

  double totalCheckedFullPrice() {
    double checkedPrice = 0;

    for (final item in FavoritesPage.checkedProducts) {
      minprice = 0;
      maxprice = 0;
      extractNumbersWithoutSpaces(item);
      if (maxprice != 0) {
        checkedPrice += item.quantity * maxprice;
      } else {
        checkedPrice += item.quantity * minprice;
      }
    }
    print(checkedPrice);
    return checkedPrice;
  }

  double totalCheckedDiscount() {
    double checkedPrice = 0;
    double checkedDiscount = 0;

    for (final item in FavoritesPage.checkedProducts) {
      minprice = 0;
      maxprice = 0;
      extractNumbersWithoutSpaces(item);
      if (maxprice != 0) {
        checkedPrice += item.quantity * maxprice;
      } else {
        checkedPrice += item.quantity * minprice;
      }
      checkedDiscount += item.quantity * minprice;
    }
    print(checkedDiscount - checkedPrice);
    return checkedDiscount - checkedPrice;
  }

  int totalCheckedQuantity() {
    int checkedQ = 0;
    for (final item in FavoritesPage.checkedProducts) {
      checkedQ += item.quantity;
    }
    print(checkedQ);
    return checkedQ;
  }

  int maxprice = 0;
  int minprice = 0;
  bool hasDelWord(String text) {
    final RegExp regExp = RegExp(r'\bdel\b');
    return regExp.hasMatch(text);
  }

  bool inSkidka = false;
  void extractNumbersWithoutSpaces(ProductItem product) {
    inSkidka = hasDelWord(product.pricehtml);
    final String stringWithoutSpaces = product.pricehtml.replaceAll(' ', '');

    // Use the regular expression to extract numbers
    final RegExp regExp = RegExp(r'\d+');
    final List<Match> matches = regExp.allMatches(stringWithoutSpaces).toList();

    // Convert matched substrings to integers and return a list of numbers
    final List prices =
        matches.map((match) => int.parse(match.group(0)!)).toList();
    if (prices.length == 2 && !prices.contains(0)) {
      if (prices[0] > prices[1]) {
        maxprice = prices[0];
        minprice = prices[1];
      } else {
        minprice = prices[0];
        maxprice = prices[1];
      }
    } else {
      if (prices.isNotEmpty) {
        minprice = prices.last;
      } else {
        minprice = 0;
      }
    }
  }

  String getSlugByName(String name) {
    for (final item in slugs) {
      if (item['name'] == name) {
        return item['slug'];
      }
    }
    return '';
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
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.13),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: _launchURLInBrowser,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Lottie.network(
                                      'https://lottie.host/d0ba0ef0-cf1e-4fa9-9ba4-f48719c429ec/InLcb3pvJ8.json',
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 15),
                                        Text(
                                          'Есть сервис доставки!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text('Подробнее')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                          SliverToBoxAdapter(
                              child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (FavoritesPage.checkedProducts.isEmpty) {
                                      return;
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
                                    print(FavoritesPage.orderProducts.length);
                                    print(FavoritesPage.checkedProducts.length);
                                  },
                                  child: Text(
                                    'Удалить выбранные',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: FavoritesPage
                                              .checkedProducts.isNotEmpty
                                          ? Colors.black
                                          : Colors.grey.shade500,
                                    ),
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
                                            FavoritesPage.checkedProducts
                                                .clear();
                                            print(
                                                FavoritesPage.checkedProducts);
                                          } else {
                                            print(checkAll);
                                            checkAll = !checkAll;
                                            FavoritesPage.checkedProducts
                                                .addAll(FavoritesPage
                                                    .orderProducts);
                                            print(
                                                FavoritesPage.checkedProducts);
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ],
                            ),
                          )),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final product =
                                    FavoritesPage.orderProducts[index];
                                final int count = product.quantity;
                                final bool isChecked = FavoritesPage
                                    .checkedProducts
                                    .contains(product);
                                print(index);
                                minprice = 0;
                                maxprice = 0;
                                extractNumbersWithoutSpaces(product);
                                print(minprice);
                                print(maxprice);
                                final List<ProductItem> ord = [];

                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                                    product: product),
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
                                                imageUrl: (product
                                                        .images.isNotEmpty)
                                                    ? product.images.first
                                                    : 'https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png',
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                errorWidget:
                                                    (context, url, error) =>
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${formatNumber(int.parse(minprice.toString()))} сум',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    if (maxprice != 0)
                                                      Text(
                                                        '${formatNumber(int.parse(maxprice.toString()))} сум',
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors
                                                              .grey.shade500,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Checkbox(
                                                  checkColor: Colors.black,
                                                  activeColor:
                                                      Colors.grey.shade300,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  value: isChecked,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      if (value == true) {
                                                        FavoritesPage
                                                            .checkedProducts
                                                            .add(product);
                                                        print(FavoritesPage
                                                            .checkedProducts);
                                                      } else {
                                                        FavoritesPage
                                                            .checkedProducts
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
                                                const SizedBox(height: 8),
                                                Container(
                                                  height: 35,
                                                  width: 100,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color: Colors.white,
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (count > 1) {
                                                                product
                                                                    .quantity--;
                                                              } else {
                                                                FavoritesPage
                                                                    .orderProducts
                                                                    .remove(
                                                                        product);
                                                                FavoritesPage
                                                                    .checkedProducts
                                                                    .remove(
                                                                        product);
                                                              }
                                                              totalPrices();
                                                            });
                                                          },
                                                          child: const Icon(
                                                              Icons.remove),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8),
                                                        child: Text(
                                                          '$count',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              product
                                                                  .quantity++;
                                                              totalPrices();
                                                              _fetchCategoryProducts();
                                                            });
                                                          },
                                                          child: const Icon(
                                                              Icons.add),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Container(
                                              height: 0.1,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                );
                              },
                              childCount: FavoritesPage.orderProducts.length,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: ColoredBox(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ваш заказ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          totalCheckedQuantity().toString() +
                                              ' товара',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          formatNumber(totalCheckedFullPrice()
                                                  .round()) +
                                              ' ' +
                                              context.tr('uzs'),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Скидка на товары',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          formatNumber(totalCheckedDiscount()
                                                  .round()) +
                                              ' ' +
                                              context.tr('uzs'),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Итого',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          formatNumber(
                                                  totalCheckedPrice().round()) +
                                              ' ' +
                                              context.tr('uzs'),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                              child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              'Рекомендуем',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          )),
                          SliverToBoxAdapter(
                              child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            height: 365.0,
                            child: productsCategory.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productsCategory.length,
                                    itemBuilder: (context, index) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          child: SizedBox(
                                            height: 400,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.47,
                                            child: ProductCard(
                                              products: productsCategory[index],
                                              isDiscount: false,
                                            ),
                                          ),
                                        ))
                                : Center(
                                    // Display a message or loading indicator when productsCategory is empty
                                    child: CircularProgressIndicator(),
                                  ),
                          )),
                        ],
                      )),
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
                                  if (localSource.box.get(AppKeys.hasProfile,
                                      defaultValue: false)) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderScreen(
                                          totalPrice: totalCheckedPrice(),
                                          orderProducts:
                                              FavoritesPage.checkedProducts,
                                        ),
                                      ),
                                    );
                                  } else {
                                    showCustomSnackBar(
                                        context, 'Создайте профиль');
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
  void navigateToHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.read<MainBloc>().add(const MainEventChanged(BottomMenu.profile));
  }

  void showCustomSnackBar(BuildContext context, String message) {
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
        action: SnackBarAction(
          label: 'Перейти',
          textColor: Colors.white, // Change the label as needed
          onPressed: () {
            // Add the action you want to perform when the button is clicked
            // For example, you can navigate to a new screen.
            // navigateToHome(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPage()));
          },
        ),
      ),
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
