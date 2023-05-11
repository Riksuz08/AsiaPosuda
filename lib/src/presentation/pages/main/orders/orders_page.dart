import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: kToolbarHeight * 2,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                context.translate("orders"),
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),
          SliverPadding(
            padding:
                MediaQuery.of(context).removePadding(removeTop: true).padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    onTap: () {},
                    title: Text("Title $index"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
