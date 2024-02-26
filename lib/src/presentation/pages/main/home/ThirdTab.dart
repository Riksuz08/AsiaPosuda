import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/services/http_service.dart';
import '../../../../data/models/products/products_data.dart';
import '../../products/components/product_card.dart';

// Skidka
class ThirdTab extends StatefulWidget {
  const ThirdTab({super.key});

  @override
  State<ThirdTab> createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab>
    with AutomaticKeepAliveClientMixin {
  static const String category1 = 'Масленка';
  static const String slug1 = 'maslenki';
  static const String category2 = 'Масленка';
  static const String slug2 = 'termosy';
  static const String category3 = 'Масленка';
  static const String slug3 = 'mylniczy';
  static const String category4 = 'Масленка';
  static const String slug4 = 'vedra';
  static const String category5 = 'Масленка';
  static const String slug5 = 'uborka';
  static const String category6 = 'Масленка';
  static const String slug6 = 'dom-i-hozyajstvo';
  static const String banner1 =
      'https://asiaposuda.uz/wp-content/uploads/2023/10/1.png';
  static const String banner2 =
      'https://asiaposuda.uz/wp-content/uploads/2023/10/1.png';
  static const String banner3 =
      'https://asiaposuda.uz/wp-content/uploads/2023/10/1.png';

  final PagingController<int, ProductItem> _pagingController =
      PagingController(firstPageKey: 10);
  final PagingController<int, ProductItem> _pagingControllerFirst =
      PagingController(firstPageKey: 1);
  final PagingController<int, ProductItem> _pagingControllerSecond =
      PagingController(firstPageKey: 2);
  final PagingController<int, ProductItem> _pagingControllerThird =
      PagingController(firstPageKey: 3);
  final PagingController<int, ProductItem> _pagingController4 =
      PagingController(firstPageKey: 4);
  final PagingController<int, ProductItem> _pagingController5 =
      PagingController(firstPageKey: 5);
  final PagingController<int, ProductItem> _pagingController6 =
      PagingController(firstPageKey: 6);
  final PagingController<int, ProductItem> _pagingController7 =
      PagingController(firstPageKey: 7);
  final PagingController<int, ProductItem> _pagingController8 =
      PagingController(firstPageKey: 8);
  final PagingController<int, ProductItem> _pagingController9 =
      PagingController(firstPageKey: 9);
  late RxList productsCategory = [].obs;
  late RxList productsCategorySecond = [].obs;
  late RxList productsCategory3 = [].obs;
  late RxList productsCategory4 = [].obs;
  late RxList productsCategory5 = [].obs;
  late RxList productsCategory6 = [].obs;
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
    _pagingController4.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingController5.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingController6.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingController7.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingController8.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingController9.addPageRequestListener((pageKey) {
      _fetchPageSome(pageKey);
    });
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    _fetchCategoryProducts();
    _fetchCategoryProductsSecond();
    _fetchCategoryProducts3();
    _fetchCategoryProducts4();
    _fetchCategoryProducts5();
    _fetchCategoryProducts6();
  }

  Future<void> _fetchPageSome(int pageKey) async {
    try {
      final products = await HttpService().fetchProductsByDiscount(pageKey);

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
      }
      if (pageKey == 4) {
        final first20Products = products.take(20).toList();
        _pagingController4.appendPage(first20Products, pageKey + 1);
      }
      if (pageKey == 5) {
        final first20Products = products.take(20).toList();
        _pagingController5.appendPage(first20Products, pageKey + 1);
      }
      if (pageKey == 6) {
        final first20Products = products.take(20).toList();
        _pagingController6.appendPage(first20Products, pageKey + 1);
      }
      if (pageKey == 7) {
        final first20Products = products.take(20).toList();
        _pagingController7.appendPage(first20Products, pageKey + 1);
      }
      if (pageKey == 8) {
        final first20Products = products.take(20).toList();
        _pagingController8.appendPage(first20Products, pageKey + 1);
      }
      if (pageKey == 9) {
        final first20Products = products.take(20).toList();
        _pagingController9.appendPage(first20Products, pageKey + 1);
      } else {
        _pagingControllerFirst.appendLastPage([]);
        _pagingControllerSecond.appendLastPage([]);
        _pagingControllerThird.appendLastPage([]);
        _pagingController4.appendLastPage([]);
        _pagingController5.appendLastPage([]);
        _pagingController6.appendLastPage([]);
        _pagingController7.appendLastPage([]);
        _pagingController8.appendLastPage([]);
        _pagingController9.appendLastPage([]);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsByDiscount(pageKey);

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
        slug1,
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
        slug2,
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

  Future<void> _fetchCategoryProducts3() async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        slug3,
        1,
      );
      setState(() {
        productsCategory3 = products.obs;
      });
      print(productsCategory3);
    } on (Error,) {
      throw 'Error';
    }
  }

  Future<void> _fetchCategoryProducts4() async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        slug4,
        1,
      );
      setState(() {
        productsCategory4 = products.obs;
      });
      print(productsCategory4);
    } on (Error,) {
      throw 'Error';
    }
  }

  Future<void> _fetchCategoryProducts5() async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        slug5,
        1,
      );
      setState(() {
        productsCategory5 = products.obs;
      });
      print(productsCategory5);
    } on (Error,) {
      throw 'Error';
    }
  }

  Future<void> _fetchCategoryProducts6() async {
    try {
      final products =
          await Get.put(HttpService()).fetchProductsOfSubCategories(
        slug6,
        1,
      );
      setState(() {
        productsCategory6 = products.obs;
      });
      print(productsCategory6);
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
              noItemsFoundIndicatorBuilder: (_) => Center(
                    child: CircularProgressIndicator(),
                  )),
        ),
        SliverToBoxAdapter(child: Obx(() {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.grey.shade200,
              height: 380.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        category1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  productsCategory.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsCategory.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ProductCard(
                                        products: productsCategory[index],
                                        isDiscount: false,
                                      ),
                                    ),
                                  )))
                      : Center(
                          // Display a message or loading indicator when productsCategory is empty
                          child: CircularProgressIndicator(),
                        ),
                ],
              ));
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
        SliverToBoxAdapter(child: Obx(() {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.grey.shade200,
              height: 400.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        category2,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  productsCategorySecond.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsCategorySecond.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: SizedBox(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ProductCard(
                                        products: productsCategorySecond[index],
                                        isDiscount: false,
                                      ),
                                    ),
                                  )))
                      : Center(
                          // Display a message or loading indicator when productsCategory is empty
                          child: CircularProgressIndicator(),
                        ),
                ],
              ));
        })),
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
                banner1,
              ),
            ),
          ),
        )),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingController4,
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
        SliverToBoxAdapter(child: Obx(() {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.grey.shade200,
              height: 400.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        category3,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  productsCategory3.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsCategory3.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: SizedBox(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ProductCard(
                                        products: productsCategory3[index],
                                        isDiscount: false,
                                      ),
                                    ),
                                  )))
                      : Center(
                          // Display a message or loading indicator when productsCategory is empty
                          child: CircularProgressIndicator(),
                        ),
                ],
              ));
        })),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingController5,
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
        SliverToBoxAdapter(child: Obx(() {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.grey.shade200,
              height: 400.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        category4,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  productsCategory4.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsCategory4.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: SizedBox(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ProductCard(
                                        products: productsCategory4[index],
                                        isDiscount: false,
                                      ),
                                    ),
                                  )))
                      : Center(
                          // Display a message or loading indicator when productsCategory is empty
                          child: CircularProgressIndicator(),
                        ),
                ],
              ));
        })),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingController6,
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
                banner2,
              ),
            ),
          ),
        )),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingController7,
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
        SliverToBoxAdapter(child: Obx(() {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.grey.shade200,
              height: 400.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        category5,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  productsCategory5.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsCategory5.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: SizedBox(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ProductCard(
                                        products: productsCategory5[index],
                                        isDiscount: false,
                                      ),
                                    ),
                                  )))
                      : Center(
                          // Display a message or loading indicator when productsCategory is empty
                          child: CircularProgressIndicator(),
                        ),
                ],
              ));
        })),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingController8,
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
        SliverToBoxAdapter(child: Obx(() {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.grey.shade200,
              height: 400.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        category6,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  productsCategory6.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsCategory6.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: SizedBox(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ProductCard(
                                        products: productsCategory6[index],
                                        isDiscount: false,
                                      ),
                                    ),
                                  )))
                      : Center(
                          // Display a message or loading indicator when productsCategory is empty
                          child: CircularProgressIndicator(),
                        ),
                ],
              ));
        })),
        PagedSliverGrid<int, ProductItem>(
          pagingController: _pagingController9,
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
                banner3,
              ),
            ),
          ),
        )),
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
    _pagingController4.dispose();
    _pagingController5.dispose();
    _pagingController6.dispose();
    _pagingController7.dispose();
    _pagingController8.dispose();
    _pagingController9.dispose();

    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
