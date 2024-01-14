import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:sample_bloc_mobile/src/data/models/product_categoories/categories.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/orders/subcategories_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/products_list.dart';
import 'package:shimmer/shimmer.dart';


part 'mixin/order_mixin.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>  {

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();

   return Scaffold(

       body: ColoredBox(
         color: Colors.white,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 50,),
             Padding(padding: EdgeInsets.symmetric(horizontal: 20),
             child: Text(context.tr('catalog'),style:
               TextStyle(
                 fontSize: 25
               ),),),

             Padding(
               padding: const EdgeInsets.only(top: 10, left:20 ,right: 20),
               child: Container(
                 decoration: BoxDecoration(
                   color: const Color(0xF1F1F1FF),
                   borderRadius: BorderRadius.circular(20), // Add border radius
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
             FutureBuilder(
               future: httpService.fetchCategory(),
               builder: (BuildContext context, AsyncSnapshot<List<CategoryData>> snapshot) {
                 if (snapshot.hasData) {
                   final List<CategoryData> categories = snapshot.data!;
                   final displayedCategories = categories
                       .where((category) => category.display == 'subcategories').toList();
                   return Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(12),
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
                                 if(displayedCategories.contains(category)) {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) =>
                                           SubCategoriesPage(id: category.id,name: category.name,),
                                     ),
                                   );
                                 }else{
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) =>
                                           ProductsList(categoryId: category.slug, count: category.count, categoryName: category.name,),
                                     ),
                                   );
                                 }
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
