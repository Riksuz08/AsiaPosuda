import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';

class ProductCarouselSlider extends StatefulWidget {
 final ProductItem product;
  const ProductCarouselSlider({super.key, required this.product});

  @override
  State<ProductCarouselSlider> createState() => _ProductCarouselSliderState();
}

class _ProductCarouselSliderState extends State<ProductCarouselSlider> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final List<String> imagesList=widget.product.images;
    return SafeArea(
      child:Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imagesList.map((e) =>
                    ColoredBox(
                      color: Colors.white,
                      child: Hero(
                        tag: widget.product.id,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          imageUrl: e,
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fitHeight
                                    )
                                ),
                              ),
                          placeholder: (context, url) =>
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      )
                    )).toList(),
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 1.5,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
