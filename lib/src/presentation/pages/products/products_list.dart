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
  const ProductsList({Key? key, required this.categoryId, required this.count, required this.categoryName}) : super(key: key);

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
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      final products = await Get.put(HttpService()).fetchProductsOfSubCategories(
        widget.categoryId,
        pageKey,
      );

      final isLastPage = products.length <
          20; // Adjust this based on your API response

      if (isLastPage) {
        _pagingController.appendLastPage(products);
      } else {

        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(products, nextPageKey);
      }
    } on (Error, ) {
      _pagingController.error = Error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final  categoryName = widget.categoryName;
    final productCount = widget.count.toString();

    return Scaffold(
      body: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xF1F1F1FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color(0xFF748BA4),
                    hintText: context.tr('search_field'),
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),

            Row(children: [
              const SizedBox(width: 10,),
              Text(
                categoryName,
                style: const TextStyle(
                    fontSize: 24
                ),
              )
            ],),

         Row(children: [
           const SizedBox(width: 10,),
           Text(
               '$productCount товара',
             style: const TextStyle(
               fontSize: 10,
               color: Colors.grey
             ),
           )
         ],),


            Expanded(
              child:PagedGridView<int, ProductItem>(
                    pagingController: _pagingController,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2
                    ),
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    builderDelegate: PagedChildBuilderDelegate<ProductItem>(
                      itemBuilder: (context, item, index) =>
                          ProductCard(products: item,isDiscount: false,),
                    ),


                  ),


            ),

          ],
        ),
      ),
    );
  }
}