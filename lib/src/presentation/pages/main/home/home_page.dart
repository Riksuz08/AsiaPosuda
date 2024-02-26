import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/FirstTab.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/SearchPage.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/SecondTab.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/favoritePage/FavoriteProductsPage.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/ThirdTab.dart';

import 'package:sample_bloc_mobile/src/presentation/pages/products/products_list.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/services/http_service.dart';
import '../../../../data/models/product_categoories/categories.dart';
import '../../../../data/models/products/products_data.dart';
import '../../products/product_details.dart';
import 'CategoryCircle.dart';
import 'HomeController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;
  final HomeController controller = Get.put(HomeController());
  final HttpService httpService = HttpService();
  List<CategoryData> categories = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchAllCategories();
  }

  Future<void> _fetchAllCategories() async {
    try {
      final allCategories = await httpService.fetchCategory();
      final displayedCategories = allCategories
          .where((category) => category.display == 'subcategories')
          .toList();
      setState(() {
        categories = allCategories;
      });
    } on Error catch (e) {
      print(e);
    }
  }

  double height = 0;

  int valueX = 0;
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<String> bannerImageUrls = [
      // 'https://asiaposuda.uz/wp-content/uploads/2023/11/skidka.png',
      'https://asiaposuda.uz/wp-content/uploads/2023/10/1.png',
      'https://asiaposuda.uz/wp-content/uploads/2023/10/2.png',
      'https://asiaposuda.uz/wp-content/uploads/2023/07/1-banner-int-ovsinlarap_result-1.jpg',
      'https://asiaposuda.uz/wp-content/uploads/2023/07/1-banner-int-manap_result.jpg',

      // Add more image URLs as needed
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            delegate: _SearchBarDelegate(
              onChanged: (value) {
                setState(() {
                  print(value.toString());
                  valueX = value.length;
                  controller.searchResults.clear();
                  if (value.length > 2) {
                    controller.fetchSearchResults(value);
                    _scrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                });
              },
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Obx(() {
                final searchResults = controller.searchResults;
                if (searchResults.isNotEmpty) {
                  return Container(
                    height: (valueX < 3)
                        ? 0
                        : MediaQuery.of(context).size.height - 165,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final product = searchResults[index];

                        return ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: product.images.first,
                            width: 50, // Adjust the width as needed
                            height: 50, // Adjust the height as needed
                            fit: BoxFit.cover,
                          ),
                          title: Text(product.name),
                          subtitle: Text(
                              '${product.price.toString()} ${context.tr('uzs')}'), // Assuming price is a numeric value
                          // Customize the UI as needed
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(product: product)));
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container(
                    height: (valueX < 3)
                        ? 0
                        : MediaQuery.of(context).size.height - 165,
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
                              color: Colors
                                  .white, // Shimmer color for the image container
                            ),
                            title: Container(
                              height: 16,
                              width: MediaQuery.of(context).size.width * 0.7,
                              color: Colors
                                  .white, // Shimmer color for the title container
                            ),
                            subtitle: Container(
                              height: 16,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: Colors
                                  .white, // Shimmer color for the subtitle container
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: bannerImageUrls
                    .map((imageUrl) => Builder(
                        builder: (BuildContext context) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductsList(
                                            categoryId: 'dinova-saina',
                                            count: 0,
                                            categoryName: 'Dinova Saina')));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: CategoryCircle(category: categories[index]),
                  ),
                ),
              ),
            ]),
          ),
          SliverPersistentHeader(
            delegate: _TabBarDelegate(
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: context.tr('populars')),
                  Tab(text: context.tr('new')),
                  Tab(text: context.tr('discount')),
                ],
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Color(0xFF79B531),
                    width: 2,
                  ),
                ),
                labelColor: const Color(0xFF79B531),
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight
                      .normal, // Change this line to set the font weight
                ),
              ),
            ),
            pinned: true,
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            SecondTab(),
            FirstTab(),
            ThirdTab(),
          ],
        ),
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final ValueChanged<String> onChanged;
  _SearchBarDelegate({required this.onChanged});
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
          color: Colors.white, // Set background color to white
          padding: const EdgeInsets.only(top: 30, left: 20, right: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xF1F1F1FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: onChanged,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Color(0xFF748BA4),
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
              const SizedBox(
                height: 10,
              )
            ],
          ));

  @override
  double get maxExtent => 108;

  @override
  double get minExtent => 108;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSizeWidget child;

  _TabBarDelegate({required this.child});

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      SizedBox.expand(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white, // Set the background color to transparent
          ),
          child: child,
        ),
      );

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
