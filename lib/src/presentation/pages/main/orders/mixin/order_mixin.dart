part of 'package:sample_bloc_mobile/src/presentation/pages/main/orders/orders_page.dart';

mixin OrdersMixin on State<OrdersPage> {
  late TabController controller;

  void initStateController(TickerProvider tickerProvider) {
    controller = TabController(length: 2, vsync: tickerProvider);
  }

  void disposeController() {
    controller.dispose();
  }
}
