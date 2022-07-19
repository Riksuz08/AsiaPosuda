import 'dart:convert';

import 'package:http/http.dart';

class YandexHelper {
  YandexHelper(this.url);

  final String url;

  Future getData() async {
    print(url);
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
