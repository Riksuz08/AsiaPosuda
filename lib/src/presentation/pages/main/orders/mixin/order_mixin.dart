part of 'package:sample_bloc_mobile/src/presentation/pages/main/orders/orders_page.dart';

mixin OrdersMixin on State<OrdersPage> {
  late final TabController tabController;

  void initStateController(TickerProvider tickerProvider) {
    tabController = TabController(length: 3, vsync: tickerProvider);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
