import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';

class ProductCarouselSlider extends StatefulWidget {
  final ProductItem product;
  final CarouselController carouselController;
  const ProductCarouselSlider({
    Key? key,
    required this.product,
    required this.carouselController,
  }) : super(key: key);

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

          if (isFullScreen) {
            // If transitioning to full screen, use a Hero animation
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FullScreenCarousel(
                    imagesList: imagesList,
                    currentIndex: currentIndex,
                    onClose: () {
                      setState(() {
                        isFullScreen = false;
                        Navigator.pop(context);
                      });
                    },
                  );
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  // You can replace the SlideTransition with FadeTransition
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },

              ),
            );
          }
        },
        child: buildCarousel(imagesList),
      ),
    );
  }

  Widget buildCarousel(List<String> imagesList) => Container(
    height: MediaQuery.of(context).size.height * 0.5,
    color: Colors.white,
    child: CarouselSlider(
      carouselController: widget.carouselController,
      items: imagesList
          .map(
            (e) => Hero(
          tag: 'image_$currentIndex',
          child: CachedNetworkImage(
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
          ),
        ),
      )
          .toList(),
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

class FullScreenCarousel extends StatelessWidget {
  final List<String> imagesList;
  final int currentIndex;
  final VoidCallback onClose;

  FullScreenCarousel({
    required this.imagesList,
    required this.currentIndex,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CarouselSlider(
            items: imagesList
                .map(
                  (e) => CachedNetworkImage(
                imageUrl: e,
                fit: BoxFit.contain,
              ),
            )
                .toList(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              initialPage: currentIndex,
            ),
          ),
          Positioned(
            top: 20,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: onClose,
            ),
          ),
        ],
      ),
    );
  }
}
