import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:sample_bloc_mobile/src/config/color_slug.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';
import 'package:sample_bloc_mobile/src/data/source/choice_chip.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/favorites/bookmark_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/orders/orders_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/components/full_description.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/product_carousel_slider.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/products_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../config/slugs.dart';
import '../../../core/services/http_service.dart';
import '../../bloc/main/main_bloc.dart';
import '../main/favoritePage/FavoriteProductsPage.dart';
import 'components/product_card.dart';

class ProductDetails extends StatefulWidget {
  final ProductItem product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String currentPrice = '';
  String regularPrice = '';
  late final ProductItem variableProduct;

  final CarouselController _carouselController = CarouselController();
  final PagingController<int, ProductItem> _pagingController =
      PagingController(firstPageKey: 1);
  bool isVisible = false;
  late List<Map<String, dynamic>> dropdownItems = [];
  late List<Map<String, dynamic>> variations = [];
  Map<String, dynamic> selectedDropdownValues = {};

  void scrollToImage(String imageUrl) {
    final index = widget.product.images.indexOf(imageUrl);
    if (index != -1) {
      _carouselController.animateToPage(index);
    }
  }

  void getItemDropDownMenu() {
    for (final item in widget.product.attributes) {
      // Assuming item.name is the name of the option and item.options is the list of options
      final Map<String, dynamic> dropdownItem = {
        'name': item.name,
        'options': item.options.toList(),
      };
      dropdownItems.add(dropdownItem);
    }

    print(dropdownItems.toString());
  }

  String removeSymbolsAndSpaces(String input) {
    // Use a regular expression to match only numbers and letters
    final RegExp regExp = RegExp(r'[a-zA-Z0-9]');

    // Use the replaceAll method to remove symbols and spaces
    return input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  bool _isButtonVisible = true;
  @override
  void initState() {
    super.initState();
    // for (final item in widget.product.variations) {
    //   print(item.image);
    //   print(item.option);
    // }
    extractNumbersWithoutSpaces();
    getItemDropDownMenu();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
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

  void shareProduct() {
    final String message =
        widget.product.name + '\n' + widget.product.permalink;
    Share.share(message);
  }

  void toggleFavorite() {
    setState(() {
      final isFavorite =
          FavoriteProductsPage.favoriteProducts.contains(widget.product);

      if (isFavorite) {
        FavoriteProductsPage.favoriteProducts.remove(widget.product);
      } else {
        FavoriteProductsPage.favoriteProducts.add(widget.product);
      }
    });
    isVisible = true;
  }

  Future<void> toggleOrder() async {
    if (id != -1) {
      final ProductItem variableProduct =
          await HttpService().fetchProductById(id);
      print(variableProduct);
      setState(() {
        final isInCart = FavoritesPage.orderProducts
            .any((product) => product.id == variableProduct.id);

        print(isInCart);
        if (isInCart) {
          final existingProduct = FavoritesPage.orderProducts
              .firstWhere((p) => p.id == variableProduct.id);

          setState(() {
            showOptionSnackBar(context, 'Есть такой товар!');
            showCustomSnackBar(context, 'Перейти на корзинку');
            // existingProduct.quantity = existingProduct.quantity + 1;
          });
        } else {
          print(variableProduct.price);
          if (variableProduct.price != '') {
            variableProduct.quantity = 1;
            FavoritesPage.orderProducts.add(variableProduct);
            FavoritesPage.checkedProducts.add(variableProduct);
            FavoritesPage.category = widget.product.categoriesName.last;
            showCustomSnackBar(context, 'Перейти на корзинку');
          } else {
            showOptionSnackBar(context, 'Нельзя добавить этот товар!');
          }
        }
      });
    } else {
      setState(() {
        if (widget.product.price != '') {
          widget.product.quantity = 1;
          FavoritesPage.orderProducts.add(widget.product);
          FavoritesPage.checkedProducts.add(widget.product);
          showCustomSnackBar(context, 'Перейти на корзинку');
        } else {
          showOptionSnackBar(context, 'Нельзя добавить этот товар!');
        }
      });
    }
  }

  int maxprice = 0;
  int minprice = 0;
  int percent = 0;
  bool hasDelWord(String text) {
    final RegExp regExp = RegExp(r'\bdel\b');
    return regExp.hasMatch(text);
  }

  bool inSkidka = false;
  void extractNumbersWithoutSpaces() {
    inSkidka = hasDelWord(widget.product.pricehtml);
    // Remove spaces from the input string
    final String stringWithoutSpaces =
        widget.product.pricehtml.replaceAll(' ', '');

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
      percent = ((maxprice - minprice) * 100 / maxprice).round();
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

  String getColorSlugByName(String name) {
    for (final item in colorSlugs) {
      if (item['name'] == name) {
        return item['slug'];
      }
    }
    return '';
  }

  String removeNonAlphanumericAndSpaces(String input) {
    RegExp alphanumeric = RegExp(r'[a-zA-Z0-9]');
    Iterable<Match> matches = alphanumeric.allMatches(input);
    return matches.map((match) => match.group(0)!).join();
  }

  String getSrcImageWithSlug(String name) {
    for (final variation in widget.product.variations) {
      if (variation.option == getColorSlugByName(name)) {
        return variation.image;
      }
    }
    return '';
  }

  int getIdWithSlug(String name) {
    for (final variation in widget.product.variations) {
      if (variation.option == getColorSlugByName(name)) {
        return variation.id;
      }
    }
    return -1;
  }

  int getIdWithOption(String name) {
    for (final variation in widget.product.variations) {
      print(
          '${removeNonAlphanumericAndSpaces(variation.option)}and${removeNonAlphanumericAndSpaces(name)}');
      if (removeNonAlphanumericAndSpaces(variation.option) ==
          removeNonAlphanumericAndSpaces(name)) {
        return variation.id;
      }
    }
    return -1;
  }

  String getSrcImageWithOption(String name) {
    for (final variation in widget.product.variations) {
      if (removeNonAlphanumericAndSpaces(variation.option) ==
          removeNonAlphanumericAndSpaces(name)) {
        return variation.image;
      }
    }
    return '';
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final products = await HttpService().fetchProductsOfSubCategories(
        getSlugByName(widget.product.categoriesName.last),
        pageKey,
      );

      _pagingController.appendLastPage(products);
    } on (Error,) catch (e) {
      _pagingController.error = e;
    }
  }

  int id = -1;
  dynamic optionx;
  @override
  Widget build(BuildContext context) {
    String? inStock;
    if (widget.product.stockstatus) {
      inStock = 'Есть в наличии';
    } else {
      inStock = 'Нет в наличии';
    }
    double generateRandomRating() {
      final random = widget.product.id;

      final lastDigit = random % 10;
      final double rating = (lastDigit / 10 + 4).toDouble();
      return rating;
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductCarouselSlider(
                    product: widget.product,
                    carouselController: _carouselController),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 6),
                    Icon(Icons.star, color: Colors.yellow, size: 20),
                    SizedBox(width: 6),
                    Text(generateRandomRating().toString(),
                        style: TextStyle(fontSize: 14)),
                    SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topRight,
                      child: Text(
                        inStock,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: widget.product.stockstatus
                              ? Color(0xFF79B531)
                              : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final dropdownItem in dropdownItems)
                      if (dropdownItem['name'] != 'Brendlar' &&
                          dropdownItem['name'] != 'Ishlab chiqarilgan davlat' &&
                          dropdownItem['name'] != 'Material')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              // Adjust the left padding as needed
                              child: Text(dropdownItem['name'] ?? ''),
                            ),
                            Wrap(
                              spacing: 8,
                              children: [
                                for (final option in dropdownItem['options'])
                                  TChoiceChip(
                                    text: option.toString(),
                                    selected: selectedDropdownValues[
                                            dropdownItem['name']] ==
                                        option,
                                    onSelected: (value) {
                                      setState(() {
                                        optionx = option;
                                        selectedDropdownValues[
                                            dropdownItem['name']] = option;
                                        print('x' +
                                            selectedDropdownValues[
                                                dropdownItem['name']]);
                                        print(getColorSlugByName(
                                            selectedDropdownValues[
                                                dropdownItem['name']]));
                                        print(getSrcImageWithSlug(
                                            selectedDropdownValues[
                                                dropdownItem['name']]));
                                        print(getIdWithSlug(
                                            selectedDropdownValues[
                                                dropdownItem['name']]));
                                        print(id.toString() + 'do');
                                        id = getIdWithSlug(
                                            selectedDropdownValues[
                                                dropdownItem['name']]);
                                        if (id == -1) {
                                          id = getIdWithOption(
                                              selectedDropdownValues[
                                                  dropdownItem['name']]);
                                        }
                                        print(id.toString() + 'posle');
                                        scrollToImage(getSrcImageWithSlug(
                                            selectedDropdownValues[
                                                dropdownItem['name']]));
                                        scrollToImage(getSrcImageWithOption(
                                            selectedDropdownValues[
                                                dropdownItem['name']]));
                                        for (final item
                                            in widget.product.variations) {
                                          if (removeSymbolsAndSpaces(
                                                  item.option) ==
                                              removeSymbolsAndSpaces(
                                                  selectedDropdownValues[
                                                      dropdownItem['name']])) {
                                            setState(() {
                                              currentPrice = item.price;
                                              regularPrice = item.regularprice;

                                              if (currentPrice ==
                                                  regularPrice) {
                                                inSkidka = false;
                                                maxprice = 0;
                                                minprice =
                                                    int.parse(currentPrice);
                                              } else if (int.parse(
                                                      regularPrice) >
                                                  int.parse(currentPrice)) {
                                                inSkidka = true;
                                                maxprice =
                                                    int.parse(regularPrice);
                                                minprice =
                                                    int.parse(currentPrice);
                                              } else {}
                                            });
                                          }
                                        }
                                        print("Current price" + currentPrice);
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ],
                        ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: inSkidka,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${formatNumber(minprice)} сум',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Visibility(
                                visible: percent == 0 ? false : true,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFF79B531)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: Text(
                                        '-' + percent.toString() + '%',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          Visibility(
                            visible: maxprice.toString() == '0' ? false : true,
                            child: Text(
                              formatNumber(maxprice) + ' ' + context.tr('uzs'),
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: percent == 0 ? false : true,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFF79B531)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    context.tr('discount'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !inSkidka,
                      child: Row(
                        children: [
                          // Visibility(
                          //   visible:
                          //       maxprice.toString() == '0' ? false : true,
                          //   child: Text(
                          //     formatNumber(maxprice) +
                          //         ' ' +
                          //         context.tr('uzs'),
                          //     style: TextStyle(
                          //         color: Colors.grey, fontSize: 12),
                          //   ),
                          // ),
                          Visibility(
                            visible: (maxprice != 0 && minprice != 0),
                            child: Text(
                              '${formatNumber(minprice)} - ${formatNumber(maxprice)} сум',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: (minprice != 0 && maxprice == 0),
                            child: Text(
                              '${formatNumber(minprice)} сум',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       formatNumber(minprice) + ' ' + context.tr('uzs'),
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Visibility(
                    //       visible: percent == 0 ? false : true,
                    //       child: Container(
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(15),
                    //               color: Color(0xFF79B531)),
                    //           child: Padding(
                    //             padding: EdgeInsets.symmetric(
                    //                 horizontal: 5, vertical: 2),
                    //             child: Text(
                    //               '-' + percent.toString() + '%',
                    //               style: TextStyle(
                    //                   color: Colors.white, fontSize: 10),
                    //             ),
                    //           )),
                    //     )
                    //   ],
                    // ),
                    // Visibility(
                    //   visible: maxprice.toString() == '0' ? false : true,
                    //   child: Text(
                    //     formatNumber(maxprice) + ' ' + context.tr('uzs'),
                    //     style: TextStyle(
                    //         decoration: TextDecoration.lineThrough,
                    //         color: Colors.grey),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Visibility(
                    //   visible: percent == 0 ? false : true,
                    //   child: Container(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(15),
                    //           color: Color(0xFF79B531)),
                    //       child: Padding(
                    //         padding: EdgeInsets.symmetric(
                    //             horizontal: 5, vertical: 2),
                    //         child: Text(
                    //           context.tr('discount'),
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 10),
                    //         ),
                    //       )),
                    // )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'Категории:  ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.product.categoriesName.join(', '),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                ),

                SizedBox(
                  height: 6,
                ),
                Visibility(
                  visible:
                      widget.product.shortdescription.isNotEmpty ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Краткое описание товара: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Html(
                          data: widget.product.shortdescription,
                          style: {
                            'ul': Style(
                              fontSize: FontSize(12),
                              fontWeight: FontWeight.normal,
                            ),
                            'p': Style(
                              fontSize: FontSize(12),
                              fontWeight: FontWeight.normal,
                            ),
                            'div': Style(
                              fontSize: FontSize(12),
                              fontWeight: FontWeight.normal,
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullDescription(
                              fulldesctription: widget.product.description,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200]),
                        child: Center(
                          child: Text(
                            context.tr('fulldesc'),
                          ),
                        ),
                      ),
                    )),

                // Row(
                //   children: [
                //     SizedBox(width: 5,),
                //     Image.asset('assets/png/asia_noText.png', width: 30,height: 30,),
                //     MaterialButton(
                //       onPressed: _launchURLInBrowser,
                //       child: Text('Открыть на сайте',style: TextStyle(color: Color(
                //           0xFF79B531)),),
                //       textColor: Colors.black,
                //       padding: const EdgeInsets.all(5.0),
                //     ),
                //   ],
                // ),

                // Container(
                //   decoration: const BoxDecoration(
                //     color: Color(0xFF79B531),
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.all(Radius.circular(15))
                //   ),
                //   child: Column(
                //     children: [
                //       Text("Доставка",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                //       Row(
                //         children: [
                //           SizedBox(width: 10,),
                //           Image(image:NetworkImage('https://asiaposuda.uz/wp-content/uploads/2021/08/delivery.webp'),width: 100,height: 100,),
                //           SizedBox(width: 10,),
                //           Expanded(child:Column(
                //             children: [
                //               Text('Доставка по всему Ташкенту  30000 сум. \n Доставка по региону по договоренности с клиентом ',
                //                 style: TextStyle(color: Colors.white),
                //               )
                //             ],
                //           ),)
                //
                //
                //         ],
                //
                //       ),
                //
                //     ],
                //   )
                // ),
                const SizedBox(
                  height: 20,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var categoryName in widget.product.categoriesName)
                        GestureDetector(
                          onTap: () {
                            print(categoryName);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsList(
                                  categoryId: getSlugByName(categoryName),
                                  count: 0,
                                  categoryName: categoryName,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF79B531),
                            ),
                            margin: EdgeInsets.only(
                                right:
                                    8), // Adjust the spacing between containers
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Text(
                                categoryName,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Похожие товары',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                SafeArea(
                  child: PagedGridView<int, ProductItem>(
                    pagingController: _pagingController,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 330,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    builderDelegate: PagedChildBuilderDelegate<ProductItem>(
                      itemBuilder: (context, item, index) => ProductCard(
                        products: item,
                        isDiscount: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          toggleFavorite();
                        },
                        icon: Icon(
                          FavoriteProductsPage.favoriteProducts
                                  .contains(widget.product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          shareProduct();
                        },
                        icon: Icon(
                          Icons.ios_share_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: maxprice.toString() == '0' ? true : false,
                    child: Text(
                      'Цена: ',
                      style: TextStyle(fontSize: 10, color: Color(0xFF727070)),
                    ),
                  ),
                  Text(
                    formatNumber(minprice) + ' ' + context.tr('uzs'),
                    style: TextStyle(fontSize: 17),
                  ),
                  Visibility(
                    visible: maxprice.toString() == '0' ? false : true,
                    child: Text(
                      formatNumber(maxprice) + ' ' + context.tr('uzs'),
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 11),
                    ),
                  ),
                ],
              ),

              // Container(
              //   padding: const EdgeInsets.all(5),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.grey.shade300,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             if (_count > 1) {
              //               _count--;
              //             }
              //           });
              //         },
              //         child: const Icon(Icons.remove),
              //       ),
              //       Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 8),
              //         child: Text(
              //           '$_count',
              //           style: const TextStyle(fontSize: 20),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             _count++;
              //           });
              //         },
              //         child: const Icon(Icons.add),
              //       ),
              //     ],
              //   ),
              // ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: _isButtonVisible,
                    child: ElevatedButton(
                      onPressed: () {
                        if (optionx.toString() != 'null' ||
                            dropdownItems.isEmpty) {
                          setState(() {
                            _isButtonVisible = false;
                            toggleOrder();
                          });

                          // Simulate animation duration
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              _isButtonVisible = true;
                            });
                          });
                        } else {
                          showOptionSnackBar(context, 'Выберите опцию');
                          print('select option');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        backgroundColor: Color(0xFF79B531),
                      ),
                      child: const Text(
                        'В корзину',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: !_isButtonVisible,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Lottie.network(
                          'https://lottie.host/f312197c-99b3-43d7-89a2-de652938e63d/5BykGjCcwC.json',
                          width: 80,
                          height: 80,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.read<MainBloc>().add(const MainEventChanged(BottomMenu.favorites));
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
            navigateToHome();
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
