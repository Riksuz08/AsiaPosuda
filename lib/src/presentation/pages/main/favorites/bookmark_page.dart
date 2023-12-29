import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/main_page.dart';
import '../../../../data/models/products/products_data.dart';
import '../../../bloc/main/main_bloc.dart';
import '../../products/product_details.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static RxList<ProductItem> orderProducts = RxList<ProductItem>();



  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int totalPrice = 0;
  int totalPriceX = 0;
  int totalProducts = 0;
  int totalProductsX = 0;

  void totalPrices() {
    print('running');
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

  @override
  void initState() {
    super.initState();
    setState(() {
      totalPrices();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:  AppBar(
          centerTitle: true, // Remove the shadow
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

      body: Obx((){
      if (FavoritesPage.orderProducts.isEmpty) {


        return ColoredBox(
          color: Colors.white,
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display your empty state UI here
                Image.asset(
                  'assets/png/empty_cart.jpg',
                  // Replace with your image URL
                  height: 200,
                  width: 200,
                  // Add any other properties as needed
                ),
                const SizedBox(height: 10),
                const Text(
                  'Время покупок !',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<MainBloc>().add(const MainEventChanged(BottomMenu.main));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF79B531), // Set the background color here
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
    }else{
        totalPrices();
        return Stack(
          children: [
            Obx(
                  () => ListView.builder(
                itemCount: FavoritesPage.orderProducts.length,
                itemBuilder: (context, index) {
                  final product = FavoritesPage.orderProducts[index];
                  final int count = product.quantity;
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(product: product),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CachedNetworkImage(
                                height: 120,
                                width: 70,
                                imageUrl: (product.images.isNotEmpty)
                                    ? product.images.first
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
                            title: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${product.price} сум'),
                                const SizedBox(height: 8,),
                                //count container
                                Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (count > 1) {
                                              product.quantity--;

                                            } else {
                                              FavoritesPage.orderProducts.remove(product);
                                            }
                                            totalPrices();
                                          });
                                        },
                                        child: const Icon(Icons.remove),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          '$count',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            product.quantity++;
                                            totalPrices();
                                          });

                                        },
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2,),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          )
                        ],
                      )
                  );
                },
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
                            '$totalPrice '+context.tr('uzs'),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            context.tr('products')+": "+totalProducts.toString(),

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
                          child:  ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF79B531), // Set the background color here
                            ),
                            child: Text(
                              context.tr('order'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }

    }),
    // Check if FavoritesPage.orderProducts is empty

    // totalPrices();
    // If the list is not empty, continue with the original UI

    );
}
