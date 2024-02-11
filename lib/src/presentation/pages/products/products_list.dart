import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/components/product_card.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/components/product_loading_grid.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/components/products_controller.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/services/http_service.dart';
import 'components/product_loading_card.dart';

class ProductsList extends StatefulWidget {
  final String categoryId;
  final int count;
  final String categoryName;
  const ProductsList(
      {Key? key,
      required this.categoryId,
      required this.count,
      required this.categoryName})
      : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final PagingController<int, ProductItem> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    print(widget.categoryId);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        widget.categoryId,
        pageKey,
      );

      final isLastPage =
          products.length < 20; // Adjust this based on your API response

      if (isLastPage) {
        _pagingController.appendLastPage(products);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(products, nextPageKey);
      }
    } on (Error,) {
      _pagingController.error = Error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = widget.categoryName;
    final productCount = widget.count.toString();

    return Scaffold(
      body: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              // Remove elevation if not needed
              automaticallyImplyLeading:
                  false, // Don't automatically add a back button
              title: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            context.tr('catalog'),
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )),
                  const Spacer(),
                  Center(
                    child:
                        Text(widget.categoryName), // Your custom center title
                  ),
                  const Spacer(),
                  Spacer(),
                  Spacer()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: int.parse(productCount) > 0
                  ? Row(
                      children: [
                        Text(
                          '$productCount товара',
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    )
                  : SizedBox(), // If productCount is 0, show an empty SizedBox
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: PagedGridView<int, ProductItem>(
                pagingController: _pagingController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 330,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                builderDelegate: PagedChildBuilderDelegate<ProductItem>(
                    itemBuilder: (context, item, index) {
                  return ProductCard(products: item, isDiscount: false);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
