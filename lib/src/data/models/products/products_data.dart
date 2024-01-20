import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';


class ProductItem {

  late int id;
  late String name;
  late String description;
  late String shortdescription;
  late String permalink;
  late List<String> images;
  late List<int> categories;
  late List<String> categoriesName;
  late int parent;
  late String price;
  late int totalsales;
  late String pricehtml;
  late bool stockstatus;
  late List<ProductAttribute> attributes;
  late int quantity;
  late List<Variations> variations;


  ProductItem({
    required this.id,
    required this.name,
    required this.description,
    required this.permalink,
    required this.shortdescription,
    required this.categories,
    required this.categoriesName,
    required this.images,
    required this.totalsales,
    required this.parent,
    required this.price,
    required this.pricehtml,
    required this.stockstatus,
    required this.attributes,
    required this.quantity,
    required this.variations
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? jsonAttributes = json['attributes'];
    final List<ProductAttribute> attributes = jsonAttributes != null
        ? jsonAttributes.map((attr) => ProductAttribute.fromJson(attr)).toList()
        : [];

    final List<dynamic>? jsonVariations = json['variations'];
    final List<Variations> variations = jsonVariations != null
        ? jsonVariations.map((attr) => Variations.fromJson(attr)).toList()
        : [];

    final List<String> imagesList = (json['images'] as List<dynamic>?)
        ?.where((image) => image != null && image['src'] != null)
        .map((image) => image['src'] as String)
        .toList()
        ?? ['https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png'];
    final List<int> categoriesList = (json['categories'] as List<dynamic>?)
        ?.where((category) => category != null)
        .map((category) {
      if (category is int) {
        return category;
      } else if (category is String) {
        // Handle cases where 'category' is a string, you may want to convert it to int or ignore it
        return int.tryParse(category) ?? 0; // Convert to int, or use a default value if conversion fails
      }
      return 0; // Default value for unknown types
    })
        .toList()
        ?? [];
    final List<String> categoriesNameList = (json['categories'] as List<dynamic>?)
        ?.whereType<String>()
        .toList()
        ?? [];
    return ProductItem(
        id: json['id'] as int,
        name: json['title'] as String,
        description:  json['description'] as String,
        permalink: json['permalink'] as String,
        shortdescription:  json['short_description'] as String,
        images: imagesList,
        categories: categoriesList,
        categoriesName: categoriesNameList,
        totalsales: json['total_sales'] !=null ? json['total_sales'] as int : 0,
        parent: json['parent_id'] != null ? json['parent_id'] as int : 0,
        price: json['price'] as String,
        pricehtml: json['price_html'] as String,
        stockstatus: json['in_stock'],
        attributes: attributes,
        quantity: 0,
      variations: variations
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': name,
    'description': description,
    'permalink' : permalink,
    'short_description': shortdescription,
    'categories': categories,
    'images': images,
    'parent': parent,
    'price': price,
    'total_sales':totalsales,
    'price_html': pricehtml, // Adjusted field name to match your JSON structure
    'in_stock': stockstatus,
    'attributes': attributes.map((attr) => attr.toJson()).toList(),
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': name,
    'price': price,
    'images': images.join(','), // Convert List<String> to a single string
    'description': description,
    'permalink':permalink,
    'short_description': shortdescription,
    'parent': parent,
    'total_sales':totalsales,
    'price_html': pricehtml,
    'in_stock': stockstatus,
    'attributes': attributes.map((attr) => attr.toJson()).toList(),
  };
  ProductItem.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        name = map['title'] as String,
        price = map['price'] as String,
        images = (map['images'] as String).split(','), // Convert back to List<String>
        description = map['description'] as String,
        permalink = map['permalink'] as String,
        totalsales = map['total_sales'] as int,
        shortdescription = map['short_description'] as String,
        parent = map['parent_id'] as int,
        pricehtml = map['price_html'] as String,
        stockstatus = map['in_stock'],
        attributes = (map['attributes'] as List<dynamic>)
            .map((attr) => ProductAttribute.fromJson(attr))
            .toList();

}



class ProductAttribute {

  late String name;
  late int position;
  late bool visible;
  late bool variation;
  late List<String> options;

  ProductAttribute({

    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(

    name: json['name'] as String,
    position: json['position'] as int,
    visible: json['visible'] as bool,
    variation: json['variation'] as bool,
    options: (json['options'] as List<dynamic>?)?.cast<String>() ?? [],
  );

  Map<String, dynamic> toJson() => {

    'name': name,
    'position': position,
    'visible': visible,
    'variation': variation,
    'options': options,
  };
}


class Variations {

  late String image;
  late String option;


  Variations({
    required this.image,
    required this.option
  });

  factory Variations.fromJson(Map<String, dynamic> json) {
    final List<String> images = (json['image'] as List<dynamic>?)
        ?.where((image) => image != null && image['src'] != null)
        .map((image) => image['src'] as String)
        .toList()
        ?? [
          'https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png'
        ];

    final List<String> attributes = (json['attributes'] as List<dynamic>?)
        ?.where((image) => image != null && image['option'] != null)
        .map((image) => image['option'] as String)
        .toList()
        ?? [
          'https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png'
        ];
    return Variations(
      image: images.first,
      option: attributes.first

    );
  }
  Map<String, dynamic> toJson() => {

    'image': image,
    'option': option,

  };
}
