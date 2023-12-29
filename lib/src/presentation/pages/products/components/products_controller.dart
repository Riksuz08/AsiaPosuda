import 'package:get/get.dart';
import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';

class ProductsController extends GetxController{
  static ProductsController instance = Get.find();
  RxList<ProductItem> productList =List<ProductItem>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit(){
    getProducts();
    super.onInit();
  }
  Future<void> getProducts() async{
    try{
      isProductLoading(true);

    }
    finally{
      isProductLoading(false);
    }
  }
}