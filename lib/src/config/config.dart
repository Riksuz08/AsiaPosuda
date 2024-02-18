import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Config {
  static const String baseUrl = 'https://asiaposuda.uz/ru/wc-api/v3';
  static const String consumerKey =
      'ck_7f760b85d5a4ca6450b52275b55e0fe95c2e294c';
  static const String consumerSecret =
      'cs_a4a59b19116ae735ad530f8950a04a4d6359884c';
  static RxString nameUser = ''.obs;
  static RxString phoneUser = ''.obs;
  static late String email;
  static late String id;

  Config();
}
