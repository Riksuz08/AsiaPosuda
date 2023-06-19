import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Поиск'),
      ),
    );
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
