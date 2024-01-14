import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/services/http_service.dart';
import '../../../../data/models/products/products_data.dart';
import '../../products/components/product_card.dart';

class SearchPage extends StatefulWidget {
  final List<ProductItem> product;

  const SearchPage({Key? key, required this.product}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {



  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 310,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: widget.product.length,
        itemBuilder: (context, index) {
          final product = widget.product[index];
          return ProductCard(products: product,isDiscount: false,);
        },
    );
}
