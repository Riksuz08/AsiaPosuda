import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/components/product_loading_card.dart';

class ProductLoadingGrid extends StatefulWidget {
  const ProductLoadingGrid({super.key});

  @override
  State<ProductLoadingGrid> createState() => _ProductLoadingGridState();
}

class _ProductLoadingGridState extends State<ProductLoadingGrid> {
  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context,index)=> const ProductLoadingCard(),

    );
}
