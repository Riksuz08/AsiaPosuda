import 'package:get/get.dart';
import '../../products/CartItem.dart';
import 'DatabaseHelper.dart';

class CartController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxInt totalQuantity = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCartItems().then((items) => cartItems.assignAll(items.obs));
    _updateTotalValues();
  }

  Future<List<CartItem>> _loadCartItems() async => _databaseHelper.getCartItems();

  Future<void> addToCart(int id, String name, String price, String imageUrl, int quantity) async {
    final existingCartItem = cartItems.firstWhereOrNull((item) => item.productId == id);

    if (existingCartItem != null) {
      existingCartItem.quantity += quantity;
      await _databaseHelper.updateCartItemQuantity(existingCartItem.productId, existingCartItem.quantity);
    } else {
      final cartItem = CartItem(
        productId: id,
        productName: name,
        imageUrl: imageUrl,
        price: price,
        quantity: quantity,
      );

      cartItems.add(cartItem);
      await _databaseHelper.insertCartItem(cartItem);
    }

    _updateTotalValues();
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    _updateTotalValues();
    _databaseHelper.updateCartItemQuantity(item.productId, item.quantity);
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      _databaseHelper.updateCartItemQuantity(item.productId, item.quantity);
    } else {
      // Remove the item from the list if the quantity becomes zero
      cartItems.remove(item);
      _databaseHelper.deleteCartItem(item.productId);
    }

    _updateTotalValues();
  }

  Future<void> clearCart() async {
    cartItems.clear();
    _updateTotalValues();
    await _databaseHelper.clearCart();
  }

  void _updateTotalValues() {
    totalQuantity.value = cartItems.fold(0, (sum, item) => sum + item.quantity);
    totalPrice.value = cartItems.fold(0, (sum, item) => sum + (item.quantity * double.parse(item.price)));
  }
}
