

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sample_bloc_mobile/src/data/models/product_categoories/categories.dart';
import 'package:sample_bloc_mobile/src/data/models/product_categoories/sub_categories.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/profile_page.dart';
import '../../config/config.dart';
import '../../config/router/app_routes.dart';

class HttpService {
  Future<List<CategoryData>> fetchCategory() async {
    final responce = await http.get(Uri.parse(
        '${Config
            .baseUrl}/products/categories?per_page=100&consumer_key=${Config
            .consumerKey}&consumer_secret=${Config.consumerSecret}&parent=0'
    ));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body);

      final List<CategoryData> categories = body
          .map(
            (category) {
          print(category);
          return CategoryData.fromJson(category);
        },
      )
          .toList();
      return categories;
    } else {
      throw Exception('Failed');
    }
  }


  Future<List<SubCategoryData>> fetchSubCategory(int parent) async {
    final responce = await http.get(Uri.parse(
        '${Config.baseUrl}/products/categories?per_page=20&consumer_key=${Config
            .consumerKey}&consumer_secret=${Config
            .consumerSecret}&parent=${parent}'
    ));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body);

      final List<SubCategoryData> categories = body
          .map(
            (category) {
          print(category);
          return SubCategoryData.fromJson(category);
        },
      )
          .toList();
      return categories;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductItem>> fetchProductsOfSubCategories(int category,
      int pageNo) async {
    final responce = await http.get(Uri.parse(
        '${Config
            .baseUrl}/products?per_page=20&page=${pageNo}&consumer_key=${Config
            .consumerKey}&consumer_secret=${Config
            .consumerSecret}&category=${category}'
    ));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body);

      final List<ProductItem> products = body
          .map(
            (product) {
          print(product);
          return ProductItem.fromJson(product);
        },
      )
          .toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductItem>> fetchAllProducts(int pageNo) async {
    try {
      final response = await http.get(Uri.parse(
          '${Config
              .baseUrl}/products?per_page=20&page=${pageNo}&consumer_key=${Config
              .consumerKey}&consumer_secret=${Config.consumerSecret}'
      ));

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);

        final List<ProductItem> products = body
            .map(
              (product) {
            print(product);
            return ProductItem.fromJson(product);
          },
        )
            .toList();
        return products;
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error Type: ${e.runtimeType}');
      print('Error Message: $e');
      throw e; // Rethrow the caught exception
    }
  }

  Future<List<ProductItem>> fetchSearchProducts(String searchItem) async {
    final responce = await http.get(Uri.parse(
        '${Config
            .baseUrl}/products?per_page=100&search=${searchItem}&page=1&consumer_key=${Config
            .consumerKey}&consumer_secret=${Config.consumerSecret}'
    ));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body);

      final List<ProductItem> products = body
          .map(
            (product) {
          print(product);
          return ProductItem.fromJson(product);
        },
      )
          .toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductItem>> fetchProductsByPopularity(int pageNo) async {
    final responce = await http.get(Uri.parse(
        '${Config
            .baseUrl}/products?orderby=popularity&per_page=20&page=${pageNo}&consumer_key=${Config
            .consumerKey}&consumer_secret=${Config.consumerSecret}'
    ));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body);

      final List<ProductItem> products = body
          .map(
            (product) {
          print(product);
          return ProductItem.fromJson(product);
        },
      )
          .toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<ProductItem> fetchProduct(int productId) async {
    final response = await http.get(Uri.parse(
      '${Config.baseUrl}/products/$productId?consumer_key=${Config
          .consumerKey}&consumer_secret=${Config.consumerSecret}',
    ));

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      print(body);
      return ProductItem.fromJson(body);
    } else {
      throw Exception('Failed to load product');
    }
  }


  Future<List<dynamic>> getRequest(String url) async {
    final responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body);
      return body;
    } else {
      throw Exception('Failed');
    }
  }

  Future<bool> registerUser(TextEditingController emailController,
      TextEditingController nameController,
      TextEditingController surnameController,
      TextEditingController passwordController,
      TextEditingController phoneController) async {
    const url =
        '${Config.baseUrl}/customers?consumer_key=${Config
        .consumerKey}&consumer_secret=${Config.consumerSecret}';

    final Map<String, dynamic> data = {
      "email": emailController.text,
      "first_name": nameController.text,
      "last_name": surnameController.text,
      "password": passwordController.text,
      "billing": {
        "first_name": nameController.text,
        "last_name": surnameController.text,
        "company": "",
        "address_1": "",
        "address_2": "",
        "city": "",
        "state": "",
        "postcode": "",
        "country": "",
        "email": emailController.text,
        "phone": phoneController.text
      },
      "shipping": {
        "first_name": nameController.text,
        "last_name": surnameController.text,
        "company": "",
        "address_1": "",
        "address_2": "",
        "city": "",
        "state": "",
        "postcode": "",
        "country": ""
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        // Request successful, you can handle the response here
        localSource.setHasProfile(value: true);
        print('User registered successfully');
        return true;
      } else {
        // Request failed, handle the error
        print('Failed to register user. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
      return false;
    }
  }

  Future<bool> loginUser(
      TextEditingController emailController,
      TextEditingController passwordController,
      ) async {
    const url = 'https://asiaposuda.uz/ru/wp-json/api/v1/token';
    final String email = emailController.text;
    final List<String> parts = email.split('@');
    final String username = parts.first;
    final Map<String, dynamic> data = {
      "username": username,
      "password": passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );

      if (response.statusCode == 200) {
        localSource.setHasProfile(value: true);
        // Login successful
        print('Login successful');
        print('Token: ${response.body}');
        return true;
      } else {
        // Login failed, handle the error
        print('Failed to login. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
      return false;
    }
  }
  Future<void> getUser(String email) async {
    final response = await http.get(Uri.parse(
      '${Config.baseUrl}/customers?email=$email&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}',
    ));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);

      if (body.isNotEmpty) {
        final Map<String, dynamic> customerData = body.first;
        final Map<String, dynamic> billing = customerData['billing'];

        final String firstName = billing['first_name'];
        final String phoneNumber = billing['phone'];

       Config.nameUser=firstName.obs;
       Config.phoneUser=phoneNumber.obs;

      } else {
        throw Exception('Customer not found');
      }
    } else {
      print(response.statusCode);
      throw Exception('Failed to load customer');
    }
  }

}
