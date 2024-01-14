import 'package:get/get.dart';
import '../../../../core/services/http_service.dart';
import '../../../../data/models/products/products_data.dart';

class HomeController extends GetxController {
  final HttpService httpService = HttpService();
  final RxList<ProductItem> searchResults = <ProductItem>[].obs;

  Future<void> fetchSearchResults(String query) async {
    try {
      final products = await httpService.fetchSearchProducts(query);

      if (products.isNotEmpty) {
        searchResults.assignAll(products);
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}
