import 'package:get/get.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/favorites/CartController.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
            () => CartController());
  }
}