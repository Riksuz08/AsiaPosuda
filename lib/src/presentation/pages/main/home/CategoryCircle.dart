import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/product_categoories/categories.dart';
import '../../products/products_list.dart';


class CategoryCircle extends StatelessWidget {
  final CategoryData category;

  const CategoryCircle({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductsList(
            categoryId: category.slug, // Use the appropriate ID for the category
            count: category.count,
            categoryName: category.name,
          ),
        ),
      );
    },
    child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(category.image!),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          category.name,
          style: TextStyle(fontSize: 8),
        ),
      ],
    ),
  );
}
