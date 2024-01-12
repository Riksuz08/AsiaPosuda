import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart' as pr;
import '../../../../data/models/products/products_data.dart';
import '../../main/favoritePage/FavoriteProductsPage.dart';
import '../product_details.dart';

class ProductCard extends StatefulWidget {
  final ProductItem products;
 final bool isDiscount;
  const ProductCard({Key? key, required this.products, required this.isDiscount}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  bool isVisible=false;
  void toggleFavorite()  {
    setState(() {
      final isFavorite = FavoriteProductsPage.favoriteProducts.contains(widget.products);

      if (isFavorite) {
        FavoriteProductsPage.favoriteProducts.remove(widget.products);
      } else {
        FavoriteProductsPage.favoriteProducts.add(widget.products);

      }

    });
    isVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    double generateRandomRating() {
      final  random = widget.products.id;

      final lastDigit = random % 10;
      final double rating = (lastDigit/10 + 4).toDouble();
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
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Flexible(
                    flex: 6,
                    child: Center(
                      child: Hero(
                        tag: widget.products.id,
                        child: Container(
                          width: 120,
                          height: 120,
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
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    flex: 6,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.products.name,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow, size: 14),
                                SizedBox(width: 6),
                                Text(generateRandomRating().toString(), style: TextStyle(fontSize: 10)),
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
                            Text(
                              '${widget.products.price} сум',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: const Color(0xFF79B531),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child:  Container(
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
                        FavoriteProductsPage.favoriteProducts.contains(widget.products)
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
                top: -18,
                left: -18,
                child:  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF79B531),
                    ),
                    child:Padding(
                      padding: EdgeInsets.only(top: 10,left: 10),
                      child:  Center(
                          child: Transform.rotate(
                            angle: -0.7,
                            child: Text(
                              (widget.products.id%10+13).toString()+'%',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                      ),
                    )
                ),

              ))
            ],
          ),
        ),
      ),
    );
  }
}

