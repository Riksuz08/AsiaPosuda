import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Config {
  static const String baseUrl = 'https://asiaposuda.uz/ru/wc-api/v3';
  static const String consumerKey =
      'ck_ff9f063a1925b2965a7ff2fb075f2af261fe629b';
  static const String consumerSecret =
      'cs_f7f54df78756a4d561b7f0b4c57b0b1e774e58f8';
  static RxString nameUser = ''.obs;
  static RxString phoneUser = ''.obs;
  static late String email;
  static late String id;

  Config();
}
