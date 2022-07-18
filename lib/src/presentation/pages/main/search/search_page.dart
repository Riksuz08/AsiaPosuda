import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).search),
        bottom: TabBar(
          controller: controller,
          padding: AppUtils.kPaddingAll6,
          tabs: [
            Tab(text: AppTranslations.of(context).dark),
            Tab(text: AppTranslations.of(context).light),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          Material(color: AppColors.backgroundDark),
          Material(color: AppColors.backgroundLight),
        ],
      ),
    );
  }
}
