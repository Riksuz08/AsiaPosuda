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
  late String pricehtml;
  late String stockstatus;
  late List<ProductAttribute> attributes;
  late int quantity;


  ProductItem({
    required this.id,
    required this.name,
    required this.description,
    required this.permalink,
    required this.shortdescription,
    required this.categories,
    required this.categoriesName,
    required this.images,
    required this.parent,
    required this.price,
    required this.pricehtml,
    required this.stockstatus,
    required this.attributes,
    required this.quantity
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? jsonAttributes = json['attributes'];
    final List<ProductAttribute> attributes = jsonAttributes != null
        ? jsonAttributes.map((attr) => ProductAttribute.fromJson(attr)).toList()
        : [];
    List<String> imagesList = [];

    if (json['images'] != null) {
      final List<dynamic> imageList = json['images'];

      for (final image in imageList) {
        if (image['src'] != null) {
          imagesList.add(image['src'] as String);
        }
      }
    } else {
      imagesList = ['https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png'];
    }
    List<int> categoriesList = [];

    if (json['categories'] != null) {
      final List<dynamic> categoryList = json['categories'];

      for (final image in categoryList) {
        if (image['id'] != null) {
          categoriesList.add(image['id']);
        }
      }
    } else {
      categoriesList = [];
    }
    List<String> categoriesNameList = [];

    if (json['categories'] != null) {
      final List<dynamic> categoryList = json['categories'];

      for (final image in categoryList) {
        if (image['name'] != null) {
          categoriesNameList.add(image['name']);
        }
      }
    } else {
      categoriesNameList = [];
    }
    return ProductItem(
      id: json['id'] as int,
      name: json['name'] as String,
      description:  json['description'] as String,
      permalink: json['permalink'] as String,
      shortdescription:  json['short_description'] as String,
      images: imagesList,
      categories: categoriesList,
      categoriesName: categoriesNameList,
      parent: json['parent'] != null ? json['parent'] as int : 0,
      price: json['price'] as String,
      pricehtml: json['price_html'] as String,
      stockstatus: json['stock_status'] as String,
      attributes: attributes,
      quantity: 0
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'permalink' : permalink,
    'short_description': shortdescription,
    'categories': categories,
    'images': images,
    'parent': parent,
    'price': price,
    'price_html': pricehtml, // Adjusted field name to match your JSON structure
    'stock_status': stockstatus,
    'attributes': attributes.map((attr) => attr.toJson()).toList(),
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'price': price,
    'images': images.join(','), // Convert List<String> to a single string
    'description': description,
    'permalink':permalink,
    'short_description': shortdescription,
    'parent': parent,
    'price_html': pricehtml,
    'stock_status': stockstatus,
    'attributes': attributes.map((attr) => attr.toJson()).toList(),
  };
  ProductItem.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        name = map['name'] as String,
        price = map['price'] as String,
        images = (map['images'] as String).split(','), // Convert back to List<String>
        description = map['description'] as String,
        permalink = map['permalink'] as String,
        shortdescription = map['short_description'] as String,
        parent = map['parent'] as int,
        pricehtml = map['price_html'] as String,
        stockstatus = map['stock_status'] as String,
        attributes = (map['attributes'] as List<dynamic>)
            .map((attr) => ProductAttribute.fromJson(attr))
            .toList();

}



class ProductAttribute {
  late int id;
  late String name;
  late int position;
  late bool visible;
  late bool variation;
  late List<String> options;

  ProductAttribute({
    required this.id,
    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
    id: json['id'] as int,
    name: json['name'] as String,
    position: json['position'] as int,
    visible: json['visible'] as bool,
    variation: json['variation'] as bool,
    options: (json['options'] as List<dynamic>?)?.cast<String>() ?? [],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'position': position,
    'visible': visible,
    'variation': variation,
    'options': options,
  };
}
