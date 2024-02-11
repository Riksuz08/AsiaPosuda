import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import '../../../../core/services/http_service.dart';
import '../../../../data/models/products/products_data.dart';
import '../../products/components/product_card.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab>
    with AutomaticKeepAliveClientMixin {
  final PagingController<int, ProductItem> _pagingController =
      PagingController(firstPageKey: 4);
  final PagingController<int, ProductItem> _pagingControllerFirst =
      PagingController(firstPageKey: 1);
  final PagingController<int, ProductItem> _pagingControllerSecond =
      PagingController(firstPageKey: 2);
  final PagingController<int, ProductItem> _pagingControllerThird =
      PagingController(firstPageKey: 3);
  late RxList productsCategory = [].obs;
  late RxList productsCategorySecond = [].obs;
  @override
  void initState() {
    super.initState();

    _pagingControllerFirst.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingControllerSecond.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingControllerThird.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _fetchCategoryProducts();
    _fetchCategoryProductsSecond();
  }

  Future<void> _fetchPageSome(int pageKey) async {
    try {
      final products = await HttpService().fetchAllProducts(pageKey);

      // Load only the first 20 products
      if (pageKey == 1) {
        final first20Products = products.take(20).toList();
        _pagingControllerFirst.appendPage(first20Products, pageKey + 1);
      }
      if (pageKey == 2) {
        final first20Products = products.take(20).toList();
        _pagingControllerSecond.appendPage(first20Products, pageKey + 1);
      }
      if (pageKey == 3) {
        final first20Products = products.take(20).toList();
        _pagingControllerThird.appendPage(first20Products, pageKey + 1);
      } else {
        _pagingControllerFirst.appendLastPage([]);
        _pagingControllerSecond.appendLastPage([]);
        _pagingControllerThird.appendLastPage([]);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final products = await Get.put(HttpService()).fetchAllProducts(pageKey);

      final isLastPage = products.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(products);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(products, nextPageKey);
      }
    } on (Error,) catch (e) {
      _pagingController.error = e;
    }
  }

  Future<void> _fetchCategoryProducts() async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        'maslenki',
        1,
      );
      setState(() {
        productsCategory = products.obs;
      });
      print(productsCategory);
    } on (Error,) {
      throw 'Error';
    }
  }

  Future<void> _fetchCategoryProductsSecond() async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        'termosy',
        1,
      );
      setState(() {
        productsCategorySecond = products.obs;
      });
      print(productsCategorySecond);
    } on (Error,) {
      throw 'Error';
    }
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingControllerFirst,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisExtent: 330,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          builderDelegate: PagedChildBuilderDelegate<ProductItem>(
            itemBuilder: (context, item, index) =>
                ProductCard(products: item, isDiscount: false),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Масленка',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ),
        SliverToBoxAdapter(child: Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            color: Colors.grey.shade200,
            height: 360.0,
            child: productsCategory.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsCategory.length,
                    itemBuilder: (context, index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: SizedBox(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 0.47,
                            child: ProductCard(
                              products: productsCategory[index],
                              isDiscount: false,
                            ),
                          ),
                        ))
                : Center(
                    // Display a message or loading indicator when productsCategory is empty
                    child: CircularProgressIndicator(),
                  ),
          );
        })),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingControllerSecond,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisExtent: 330,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          builderDelegate: PagedChildBuilderDelegate<ProductItem>(
            itemBuilder: (context, item, index) =>
                ProductCard(products: item, isDiscount: false),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          margin: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10), // Adjust horizontal padding as needed
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // Adjust radius as needed
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                'https://asiaposuda.uz/wp-content/uploads/2023/10/1.png',
              ),
            ),
          ),
        )),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingControllerThird,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisExtent: 330,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          builderDelegate: PagedChildBuilderDelegate<ProductItem>(
            itemBuilder: (context, item, index) =>
                ProductCard(products: item, isDiscount: false),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Для детей',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ),
        SliverToBoxAdapter(
            child: Obx(() => Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: Colors.grey.shade200,
                  height: 365.0,
                  child: productsCategorySecond.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productsCategorySecond.length,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: SizedBox(
                                  height: 400,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  child: ProductCard(
                                    products: productsCategorySecond[index],
                                    isDiscount: false,
                                  ),
                                ),
                              ))
                      : Center(
                          // Display a message or loading indicator when productsCategory is empty
                          child: CircularProgressIndicator(),
                        ),
                ))),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisExtent: 330,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          builderDelegate: PagedChildBuilderDelegate<ProductItem>(
            itemBuilder: (context, item, index) =>
                ProductCard(products: item, isDiscount: false),
          ),
        ),
      ]);

  @override
  void dispose() {
    _pagingController.dispose();
    _pagingControllerFirst.dispose();
    _pagingControllerSecond.dispose();
    _pagingControllerThird.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
