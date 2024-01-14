import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import '../../../../data/models/products/products_data.dart';
import '../../products/components/product_card.dart';

class FavoriteProductsPage extends StatefulWidget {
  const FavoriteProductsPage({Key? key}) : super(key: key);

  static List<ProductItem> favoriteProducts = [];

  @override
  State<FavoriteProductsPage> createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {

@override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      shadowColor: Colors.grey.shade50,
      backgroundColor: Colors.white,
      title:  Text(context.tr('favorites'), style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
    ),
    body: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 330,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: FavoriteProductsPage.favoriteProducts.length,
      itemBuilder: (context, index) {
        final product = FavoriteProductsPage.favoriteProducts[index];
        return ProductCard(products: product,isDiscount: false,);
      },
    )

  );
}
