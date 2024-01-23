import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart'
    as pr;
import '../../../../data/models/products/products_data.dart';
import '../../main/favoritePage/FavoriteProductsPage.dart';
import '../product_details.dart';

class ProductCard extends StatefulWidget {
  final ProductItem products;
  final bool isDiscount;
  const ProductCard(
      {Key? key, required this.products, required this.isDiscount})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    extractNumbersWithoutSpaces();
  }

  bool isVisible = false;
  void toggleFavorite() {
    setState(() {
      final isFavorite =
          FavoriteProductsPage.favoriteProducts.contains(widget.products);

      if (isFavorite) {
        FavoriteProductsPage.favoriteProducts.remove(widget.products);
      } else {
        FavoriteProductsPage.favoriteProducts.add(widget.products);
      }
    });
    isVisible = true;
  }

  int maxprice = 0;
  int minprice = 0;
  bool hasDelWord(String text) {
    final RegExp regExp = RegExp(r'\bdel\b');
    return regExp.hasMatch(text);
  }

  bool inSkidka = false;
  void extractNumbersWithoutSpaces() {
    inSkidka = hasDelWord(widget.products.pricehtml);
    final String stringWithoutSpaces =
        widget.products.pricehtml.replaceAll(' ', '');

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
    double generateRandomRating() {
      final random = widget.products.id;

      final lastDigit = random % 10;
      final double rating = (lastDigit / 10 + 4).toDouble();
      return rating;
    }

    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                product: widget.products,
              ),
            ),
          );
        },
        child: Material(
          elevation: 2,
          shadowColor: Colors.grey.shade300,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: 140,
                      height: 170, // Adjusted height to 250
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: (widget.products.images.isNotEmpty)
                            ? widget.products.images.first
                            : 'https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          color: Colors.grey.shade300,
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.products.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 14),
                              const SizedBox(width: 6),
                              Text(generateRandomRating().toString(),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey)),
                              const SizedBox(width: 6),
                              Text('(${widget.products.totalsales} продаж)',
                                  style: const TextStyle(fontSize: 10))
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.products.categoriesName.join(', '),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            visible: inSkidka,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible:
                                      maxprice.toString() == '0' ? false : true,
                                  child: Text(
                                    formatNumber(maxprice) +
                                        ' ' +
                                        context.tr('uzs'),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                        fontSize: 12),
                                  ),
                                ),
                                Text(
                                  '${formatNumber(minprice)} сум',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
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
                                    '${formatNumber(minprice)}-\n${formatNumber(maxprice)} сум',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
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
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF79B531),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        toggleFavorite();
                      },
                      icon: Icon(
                        FavoriteProductsPage.favoriteProducts
                                .contains(widget.products)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: widget.isDiscount ? true : false,
                  child: Positioned(
                    bottom: 330 * 0.49,
                    left: 20,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF79B531),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          child: Center(
                              child: Transform.rotate(
                            angle: 0,
                            child: Text(
                              'Акция',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          )),
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
