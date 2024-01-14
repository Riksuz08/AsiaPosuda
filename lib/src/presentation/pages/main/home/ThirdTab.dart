import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/services/http_service.dart';
import '../../../../data/models/products/products_data.dart';
import '../../products/components/product_card.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({super.key});

  @override
  State<ThirdTab> createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> with AutomaticKeepAliveClientMixin{
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
      final products = await Get.put(HttpService()).fetchProductsByDiscount(pageKey);

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
  @override
  Widget build(BuildContext context) => PagedGridView<int, ProductItem>(

    shrinkWrap: true,
    pagingController: _pagingController,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

      mainAxisExtent: 330,
      childAspectRatio: 2 / 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
    ),
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(10),
    builderDelegate: PagedChildBuilderDelegate<ProductItem>(

      itemBuilder: (context, item, index) =>

          ProductCard(products: item,isDiscount: true),


    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _pagingController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
