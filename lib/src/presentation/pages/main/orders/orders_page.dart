import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import 'widgets/purchase_item_widget.dart';

part 'mixin/order_mixin.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin, OrdersMixin {
  late TabController tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Мои заказы'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: const Color(0xffE8F1F7),
              child: TabBar(
                padding: const EdgeInsets.all(4.0),
                controller: tabController,
                indicatorColor: Colors.white,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Авиабилеты', height: 36),
                  Tab(text: 'Ж/д билеты', height: 36),
                  Tab(text: 'Отели', height: 36),
                ],
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: AppUtils.kPaddingAll16,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  if (index.isEven) {
                    return PurchaseItemWidget(
                      onTap: () {},
                    );
                  }
                  return AppUtils.kBoxHeight16;
                },
                childCount: 2.doubleTheListCount,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
