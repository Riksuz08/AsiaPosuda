import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:sample_bloc_mobile/src/data/models/product_categoories/categories.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/orders/subcategories_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/products_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../products/product_details.dart';
import '../favoritePage/FavoriteProductsPage.dart';
import '../home/HomeController.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int valueX = 0;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: ColoredBox(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _SearchBarDelegate(
                onChanged: (value) {
                  setState(() {
                    print(value.toString());
                    valueX = value.length;
                    controller.searchResults.clear();
                    if (value.length > 2) {
                      controller.fetchSearchResults(value);
                    }
                  });
                },
                onClearPressed: () {
                  // Clear the text when the clear icon is pressed
                  searchController.clear();
                  setState(() {
                    valueX = 0;
                    controller.searchResults.clear();

                  });
                },
                searchController: searchController,
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Obx(() {
                final searchResults = controller.searchResults;
                if (searchResults.isNotEmpty) {
                  return Container(
                    height: (valueX < 3) ? 0 : MediaQuery.of(context).size.height - 165,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final product = searchResults[index];

                        return ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: product.images.first,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product.name),
                          subtitle: Text('${product.price.toString()} ${context.tr('uzs')}'),
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  product: product,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container(
                    height: (valueX < 3) ? 0 : MediaQuery.of(context).size.height - 165,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                            title: Container(
                              height: 16,
                              width: MediaQuery.of(context).size.width * 0.7,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 16,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: Colors.white,
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ),
            FutureBuilder(
              future: httpService.fetchCategory(),
              builder: (BuildContext context, AsyncSnapshot<List<CategoryData>> snapshot) {
                if (snapshot.hasData) {
                  final List<CategoryData> categories = snapshot.data!;
                  final displayedCategories = categories.where((category) => category.display == 'subcategories').toList();
                  return SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            if (displayedCategories.contains(category)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubCategoriesPage(
                                    id: category.id,
                                    name: category.name,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductsList(
                                    categoryId: category.slug,
                                    count: category.count,
                                    categoryName: category.name,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF79B531),
                                width: 0.5,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: category.image!,
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: CachedNetworkImage(
                                    imageUrl: category.image!,
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: categories.length,
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height, // Set a fixed height or adjust it based on your layout
                      child: const ShimmerLoadingGrid(),
                    ),
                  );

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingGrid extends StatelessWidget {
  const ShimmerLoadingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      period: Duration(milliseconds: 800),
      direction: ShimmerDirection.ltr,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF79B531),
                  width: 0.5,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final ValueChanged<String> onChanged;
  final VoidCallback? onClearPressed;
  final TextEditingController searchController;

  _SearchBarDelegate({required this.onChanged, this.onClearPressed, required this.searchController});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Container(
    color: Colors.white,
    padding: const EdgeInsets.only(top: 30, left: 20, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(context.tr('catalog'), style:
          TextStyle(
              fontSize: 25
          ),),),
        const SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xF1F1F1FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: searchController,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color(0xFF748BA4),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: onClearPressed,
                    )
                        : null,
                    hintText: context.tr('search_field'),
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteProductsPage(),
                  ),
                );
              },
              child: const Icon(Icons.favorite_border),
            ),
          ],
        ),
        const SizedBox(height: 10,)
      ],
    ),
  );

  @override
  double get maxExtent => 178;

  @override
  double get minExtent => 178;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
