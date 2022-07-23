import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                AppTranslations.of(context).home,
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
