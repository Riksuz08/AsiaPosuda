import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/services/http_service.dart';
import '../../../../data/models/product_categoories/sub_categories.dart';
import '../../products/products_list.dart';
import 'orders_page.dart';

class SubCategoriesPage extends StatefulWidget {
  final int id;
  final String name;
  const SubCategoriesPage({super.key, required this.id, required this.name});

  @override
  State<SubCategoriesPage> createState() => _SubCategoriesPageState();
}

class _SubCategoriesPageState extends State<SubCategoriesPage> {

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();

    return Scaffold(

        body:SafeArea(
          child:  ColoredBox(
            color: Colors.white,
            child: Column(
              children: [

                AppBar(

                  backgroundColor: Colors.white,
                  // Remove elevation if not needed
                  automaticallyImplyLeading: false, // Don't automatically add a back button
                  title: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:Row(
                          children: [
                            Icon(Icons.arrow_back,size: 18,),
                            SizedBox(width: 5,),
                            Text(context.tr('catalog'),style: TextStyle(fontSize: 14),),
                          ],
                        )

                      ),

                      const Spacer(),
                      Center(
                        child: Text(widget.name), // Your custom center title
                      ),
                      const Spacer(),
                      Spacer(),
                      Spacer()
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                FutureBuilder(
                  future: httpService.fetchSubCategory(widget.id),
                  builder: (BuildContext context, AsyncSnapshot<List<SubCategoryData>> snapshotSub) {
                    if (snapshotSub.hasData ) {
                      final List<SubCategoryData> categories = snapshotSub.data!;

                      return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                            child: GridView.builder(
                              cacheExtent: 99999,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of elements in each row
                                crossAxisSpacing: 4, // Spacing between columns
                                mainAxisSpacing: 4, // Spacing between rows

                              ),
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return  GestureDetector(
                                    onTap: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductsList(categoryId: category.slug, count: category.count, categoryName: category.name,),
                                        ),
                                      );

                                    },
                                    child:Container(
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
                                          placeholder: (context, url) =>Shimmer.fromColors(
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
                                    )
                                );

                              },
                            ),
                          )
                      );
                    }
                    else {
                      return const ShimmerLoadingGrid();
                    }
                  },
                ),

              ],
            ),
          ),
        )

    );
  }
}
class ShimmerLoadingGrid extends StatelessWidget {
  const ShimmerLoadingGrid({super.key});



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        period: Duration(milliseconds: 800), // Adjust shimmer animation duration
        direction: ShimmerDirection.ltr, // Adjust shimmer direction (left-to-right)
        child:Padding(
          padding: EdgeInsets.all(12),
          child:  GridView.builder(
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
        )
      ),
    );
  }
}
