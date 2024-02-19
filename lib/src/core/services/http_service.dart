import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sample_bloc_mobile/src/data/models/product_categoories/categories.dart';
import 'package:sample_bloc_mobile/src/data/models/product_categoories/sub_categories.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';
import 'package:sample_bloc_mobile/src/data/models/review/review_model.dart';

import '../../config/config.dart';
import '../../config/router/app_routes.dart';
import '../../data/models/notification/notification_data.dart';
import '../../data/models/orderData/order_model.dart';
import '../../presentation/pages/main/favorites/order_provider.dart';
import '../../presentation/pages/main/profile/order_provider.dart';

class HttpService {
  Future<List<NotificationModel>> getAllNotifications() async {
    const String apiUrl = 'https://onesignal.com/api/v1/notifications';
    const String appId = 'ad050e7d-16a8-433e-abc3-ef19a554c5eb';
    const String authorizationHeader =
        'Basic NWFkOGE4YjYtMGMyMC00YWJiLTk3YzAtODdjMmZlNjk0OGI1';

    // Construct the URL with query parameters
    final Uri url = Uri.parse('$apiUrl?app_id=$appId');

    // Set up the HTTP request headers
    final Map<String, String> headers = {
      'Authorization': authorizationHeader,
      'Content-Type': 'application/json',
    };

    try {
      final http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse =
            json.decode(response.body)['notifications'];

        // Ensure that jsonResponse is a List<dynamic> before casting
        final List<NotificationModel> notifications = jsonResponse
            .map((json) => NotificationModel.fromJson(json))
            .toList();

        return notifications;
      } else {
        print('Failed with status: ${response.statusCode}');
        print('Body: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<List<CategoryData>> fetchCategory() async {
    final responce =
        await http.get(Uri.parse('${Config.baseUrl}/products/categories'
            '?filter[limit] =100'
            '&consumer_key=${Config.consumerKey}'
            '&consumer_secret=${Config.consumerSecret}'));
    if (responce.statusCode == 200) {
      final List<dynamic> body =
          jsonDecode(responce.body)['product_categories'];

      final List<CategoryData> categories = body.map(
        (category) {
          return CategoryData.fromJson(category);
        },
      ).toList();
      return categories;
    } else {
      throw Exception('Failed');
    }
  }

  Future<OrderModel?> orderProducts(
    List<ProductItem> orderProducts,
    String name,
    String surname,
    String email,
    String phoneNumber,
    int id,
    String? addressSH,
    String? nameSH,
    String? surnameSH,
    String? phoneNumberSH,
    String totalPrice,
    String city,
    String pay,
    String delivery,
  ) async {
    final List<Map<String, dynamic>> lineItems = orderProducts.map((item) {
      return {
        'product_id': item.id,
        'quantity': item.quantity,
      };
    }).toList();

    final Map<String, dynamic> orderData = {
      'order': {
        'payment_details': {
          'method_id': pay,
          'method_title': delivery,
          'paid': true
        },
        'billing_address': {
          'first_name': name,
          'last_name': surname,
          'address_1': '',
          'city': city,
          'state': '',
          'postcode': '',
          'country': 'UZ',
          'email': email,
          'phone': phoneNumber
        },
        'shipping_address': {
          'first_name': nameSH,
          'last_name': surnameSH,
          'address_1': addressSH,
          'phone': phoneNumberSH,
          'city': city,
          'state': '',
          'postcode': '',
          'country': 'UZ'
        },
        'customer_id': id,
        'line_items': lineItems,
        'shipping_lines': [
          {'method_id': '', 'method_title': '', 'total': ''}
        ]
      }
    };

    final response = await http.post(
      Uri.parse(
        '${Config.baseUrl}/orders'
        '?consumer_key=${Config.consumerKey}'
        '&consumer_secret=${Config.consumerSecret}',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(orderData),
    );

    final List<OrderModel> orders = await getOrdersOfUser(Config.id);
    return orders.first;
  }

  Future<void> reviewProduct(
    int productId,
    String review,
    String reviewer,
    String email,
    int rating,
  ) async {
    final Map<String, dynamic> reviewData = {
      'product_id': productId,
      'review': review,
      'reviewer': reviewer,
      'reviewer_email': email,
      'rating': rating
    };

    final response = await http.post(
      Uri.parse(
        'https://asiaposuda.uz/wp-json/wc/v3/products/reviews?consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(reviewData),
    );

    print(response.body);
  }

  Future<List<OrderModel>> getOrdersOfUser(String id) async {
    final response = await http.get(
      Uri.parse('${Config.baseUrl}/customers/$id/orders'
          '?consumer_key=${Config.consumerKey}'
          '&consumer_secret=${Config.consumerSecret}'),
    );

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData['orders'].isEmpty) {
        print(responseData['orders']);
        return [];
      } else {
        final List<OrderModel> orders = [];
        for (final orderJson in responseData['orders']) {
          // Convert 'line_items' to a list of LineItems
          final List<dynamic> lineItemsJson = orderJson['line_items'];
          final List<LineItems> lineItems = List<LineItems>.from(
            lineItemsJson.map((item) => LineItems.fromJson(item)),
          );

          final OrderModel orderModel = OrderModel(
            id: orderJson['id'],
            createdAt: orderJson['created_at'],
            status: orderJson['status'],
            totalPrice: orderJson['total'],
            orderQuantity: orderJson['total_line_items_quantity'],
            lineItems: lineItems,
            city: orderJson['shipping_address']['city'],
            address_1: orderJson['shipping_address']['address_1'],
          );
          orders.add(orderModel);
        }
        return orders;
      }
    } else {
      throw Exception('Failed to fetch orders');
    }
  }

  Future<List<SubCategoryData>> fetchSubCategory(int parent) async {
    final response = await http.get(Uri.parse(
        '${Config.baseUrl}/products/categories?filter[limit] =20&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}'));

    if (response.statusCode == 200) {
      final List<dynamic> body =
          jsonDecode(response.body)['product_categories'];

      // Filter categories based on the parent value
      final List<SubCategoryData> categories = body
          .where((category) => category['parent'] == parent)
          .map((category) {
        return SubCategoryData.fromJson(category);
      }).toList();

      return categories;
    } else {
      throw Exception('Failed to fetch subcategories');
    }
  }

  Future<List<ProductItem>> fetchProductsOfSubCategories(
      String category, int pageNo) async {
    final responce = await http.get(Uri.parse(
        '${Config.baseUrl}/products?filter[limit]=20&page=${pageNo}&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}&filter[category]=${category}'));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body)['products'];

      final List<ProductItem> products = body.map(
        (product) {
          return ProductItem.fromJson(product);
        },
      ).toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductReview>> getReviewOfProducts(int id) async {
    final response = await http.get(Uri.parse(
        '${Config.baseUrl}/products/$id/reviews?filter[limit]=100&page=1&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}'));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body)['product_reviews'];

      // Assuming each element in the 'body' list is a review
      final List<ProductReview> reviews = body.map((json) {
        return ProductReview.fromJson(json);
      }).toList();

      return reviews;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductItem>> fetchAllProducts(int pageNo) async {
    try {
      final response = await http.get(Uri.parse(
          '${Config.baseUrl}/products?filter[limit] =20&page=${pageNo}&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}'));

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body)['products'];

        final List<ProductItem> products = body.map(
          (product) {
            return ProductItem.fromJson(product);
          },
        ).toList();
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

  Future<ProductItem> fetchProductById(int id) async {
    try {
      final response = await http.get(Uri.parse(
          '${Config.baseUrl}/products/$id?consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}'));

      if (response.statusCode == 200) {
        final dynamic body = jsonDecode(response.body)['product'];
        if (body != null && body is Map<String, dynamic>) {
          final ProductItem product = ProductItem.fromJson(body);
          return product;
        } else {
          throw Exception('Invalid data format');
        }
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
        '${Config.baseUrl}/products?filter[limit]=20&filter[q]=${searchItem}&page=1&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}'));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body)['products'];

      final List<ProductItem> products = body.map(
        (product) {
          return ProductItem.fromJson(product);
        },
      ).toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductItem>> fetchProductsByPopularity(int pageNo) async {
    final responce = await http.get(Uri.parse(
        '${Config.baseUrl}/products?filter[limit]=20&page=${pageNo}&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}&filter[order]=desc&filter[orderby]=meta_value_num&filter[orderby_meta_key]=total_sales'));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body)['products'];

      final List<ProductItem> products = body.map(
        (product) {
          return ProductItem.fromJson(product);
        },
      ).toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductItem>> fetchProductsByPrice(int pageNo) async {
    final responce = await http.get(Uri.parse(
        '${Config.baseUrl}/products?filter[limit]=20&page=${pageNo}&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}&filter[order]=asc&filter[orderby]=meta_value_num&filter[orderby_meta_key]=_price'));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body)['products'];

      final List<ProductItem> products = body
          .map(
            (product) => ProductItem.fromJson(product),
          )
          .toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<ProductItem>> fetchProductsByDiscount(int pageNo) async {
    final responce = await http.get(Uri.parse(
        '${Config.baseUrl}/products?filter[limit]=20&page=${pageNo}&consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}&filter[type]=variable'));
    if (responce.statusCode == 200) {
      final List<dynamic> body = jsonDecode(responce.body)['products'];

      final List<ProductItem> products = body.map(
        (product) {
          return ProductItem.fromJson(product);
        },
      ).toList();
      return products;
    } else {
      throw Exception('Failed');
    }
  }

  Future<ProductItem> fetchProduct(int productId) async {
    final response = await http.get(Uri.parse(
      '${Config.baseUrl}/products/$productId?consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}',
    ));

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);

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

  Future<bool> registerUser(
      TextEditingController emailController,
      TextEditingController nameController,
      TextEditingController surnameController,
      TextEditingController passwordController,
      TextEditingController phoneController) async {
    const url =
        '${Config.baseUrl}/customers?consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}';

    final Map<String, dynamic> data = {
      'customer': {
        'email': emailController.text,
        'first_name': nameController.text,
        'last_name': surnameController.text,
        'password': passwordController.text,
        'billing_address': {
          'first_name': nameController.text,
          'last_name': surnameController.text,
          'company': '',
          'address_1': '',
          'address_2': '',
          'city': '',
          'state': '',
          'postcode': '',
          'country': '',
          'email': emailController.text,
          'phone': phoneController.text
        },
        'shipping_address': {
          'first_name': nameController.text,
          'last_name': surnameController.text,
          'company': '',
          'address_1': '',
          'address_2': '',
          'city': '',
          'state': '',
          'postcode': '',
          'country': ''
        }
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
      'username': username,
      'password': passwordController.text,
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
      '${Config.baseUrl}/customers/email/$email?consumer_key=${Config.consumerKey}&consumer_secret=${Config.consumerSecret}',
    ));

    if (response.statusCode == 200) {
      final dynamic body = jsonDecode(response.body)['customer'];

      if (body.isNotEmpty) {
        final Map<String, dynamic> customerData = body;
        final Map<String, dynamic> billing = customerData['billing_address'];
        final int id = customerData['id'];
        final String firstName = billing['first_name'];
        final String phoneNumber = billing['phone'];

        Config.nameUser = firstName.obs;
        Config.phoneUser = phoneNumber.obs;
        Config.email = email;
        Config.id = id.toString();
      } else {
        throw Exception('Customer not found');
      }
    } else {
      print(response.statusCode);
      throw Exception('Failed to load customer');
    }
  }
}
