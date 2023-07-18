import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/bouncing_button.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.isScrollingTop != current.isScrollingTop,
        listener: listener,
        child: Scaffold(
          appBar: AppBar(title: Text(context.translate('search'))),
          body: CustomScrollView(
            controller: scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverSafeArea(
                minimum: AppUtils.kPaddingAll16,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => index.isEven
                        ? ListTile(
                            shape: AppUtils.kShapeRoundedAll12,
                            tileColor: context.color.cardColor,
                            title: Text('Item $index'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          )
                        : AppUtils.kGap12,
                    childCount: 20.doubleTheListCount,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
