import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:sample_bloc_mobile/src/data/models/product_categoories/categories.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/products_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data/models/product_categoories/sub_categories.dart';

part 'mixin/order_mixin.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();

   return Scaffold(

       body: ColoredBox(
         color: Colors.white,
         child: Column(
           children: [
             const SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.only(top: 30, left:20 ,right: 20),
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
                   final displayedCategories = categories.where((category) => category.display == 'subcategories').toList();
                   return Expanded(
                     child: ListView.builder(
                       itemCount: displayedCategories.length,
                       itemBuilder: (context, index) {
                         final category = displayedCategories[index];
                         return ExpansionTile(
                           title: Text(category.name,
                             style: const TextStyle(fontWeight: FontWeight.normal),),
                           leading: Container(
                             width: 30,
                             height: 30,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               border: Border.all(
                                 color: const Color(0xFF79B531),
                                 width: 0.5,
                               ),
                             ),
                             child: ClipOval(
                               child: Image.network(
                                 category.image!,
                                 width: 30,
                                 height: 30,
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                           childrenPadding: const EdgeInsets.only(left: 60),
                           children: [
                             FutureBuilder(
                               future: httpService.fetchSubCategory(category.id),
                               builder: (BuildContext context, AsyncSnapshot<List<SubCategoryData>> snapshotSub) {
                                 if (snapshotSub.hasData) {
                                   final List<SubCategoryData> categoriesSub = snapshotSub.data!;
                                   return ListView.builder(
                                     itemCount: categoriesSub.length,
                                     shrinkWrap: true,
                                     physics: const NeverScrollableScrollPhysics(),
                                     itemBuilder: (context, subIndex) {
                                       final categorySub = categoriesSub[subIndex];
                                       return ListTile(
                                         trailing: const Icon(Icons.arrow_forward,color: Color(
                                             0xFFB2CC89),),
                                         title: Text(categorySub.name,
                                         style: const TextStyle(fontWeight: FontWeight.normal),),
                                         leading: Container(
                                           width: 30,
                                           height: 30,
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             border: Border.all(
                                               color: Colors.green,
                                               width: 0.5,
                                             ),
                                           ),
                                           child: ClipOval(
                                             child: Image.network(
                                               categorySub.image!,
                                               width: 30,
                                               height: 30,
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                         ),
                                         onTap: (){
                                           Navigator.push(context,MaterialPageRoute(builder: (context) => ProductsList(categoryId: categorySub.slug,count: categorySub.count,categoryName:categorySub.name)));
                                           //  Navigator.pushNamed(context, '/productsOfSubCategory');
                                         },
                                       );
                                     },
                                   );
                                 } else {
                                   return const CircularProgressIndicator();
                                 }
                               },
                             ),

                           ],
                         );
                       },
                     ),
                   );
                 }
                 else {
                   return const ShimmerLoadingWidget();
                 }
               },
             ),

           ],
         ),
       )

   );
  }
}
class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Expanded(child: Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: ListView.builder(
      itemCount: 10, // Adjust the number of shimmer items as needed
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Shimmer color for the circle
            ),
          ),
          title: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 20,
            color: Colors.white, // Shimmer color for the title
          ),
        );
      },
    ),
  ));
}


class ShimmerLoadingWidgetSub extends StatelessWidget {
  const ShimmerLoadingWidgetSub({super.key});

  @override
  Widget build(BuildContext context) => Expanded(child: Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: ListView.builder(
      itemCount: 5, // Adjust the number of shimmer items as needed
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Shimmer color for the circle
            ),
          ),
          title: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 20,
            color: Colors.white, // Shimmer color for the title
          ),
        );
      },
    ),
  ));
}

