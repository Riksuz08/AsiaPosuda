import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/search/widgets/summary_tour_widget.dart';

import 'widgets/popular_tour_widget.dart';
import 'widgets/search_appbar_widget.dart';
import 'widgets/search_banner_widget.dart';
import 'widgets/search_widget.dart';

part 'mixin/search_mixin.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with TickerProviderStateMixin, SearchMixin {
  @override
  void initState() {
    super.initState();
    initStateController(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SearchAppBar(),
          const SearchWidget(),
          SearchBannerWidget(pageController: pageController),
          const SummaryTour(),
          const PopularTourWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
