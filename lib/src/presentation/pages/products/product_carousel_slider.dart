import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';
class ProductCarouselSlider extends StatefulWidget {
  final ProductItem product;

  const ProductCarouselSlider({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductCarouselSlider> createState() => _ProductCarouselSliderState();
}

class _ProductCarouselSliderState extends State<ProductCarouselSlider> {
  int currentIndex = 0;
  bool isFullScreen = false;

  @override
  Widget build(BuildContext context) {
    final List<String> imagesList = widget.product.images;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          // Toggle full screen on tap
          setState(() {
            isFullScreen = !isFullScreen;
          });
        },
        child: isFullScreen
            ? buildFullScreenCarousel(imagesList)
            : buildCarousel(imagesList),
      ),
    );
  }

  Widget buildCarousel(List<String> imagesList) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.white,
      child: CarouselSlider(
        items: imagesList.map((e) =>  CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            imageUrl: e,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.grey.shade300,
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.grey,
              ),
            ),
          ),).toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 1.1,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget buildFullScreenCarousel(List<String> imagesList) {
    return Material(
      color: Colors.white,
      child: CarouselSlider(
        items: imagesList.map((e) => CachedNetworkImage(
          imageUrl: e,
          fit: BoxFit.contain,
        )).toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          aspectRatio: MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

