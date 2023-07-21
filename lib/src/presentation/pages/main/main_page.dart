import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';

import 'favorites/bookmark_page.dart';
import 'home/home_page.dart';
import 'orders/orders_page.dart';
import 'profile/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) =>
            previous.bottomMenu != current.bottomMenu,
        builder: (_, state) => WillPopScope(
          onWillPop: () async {
            if (state.bottomMenu.index != 0) {
              context
                  .read<MainBloc>()
                  .add(MainEventChanged(BottomMenu.values[0]));
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: AnimatedSwitcher(
              duration: animationDuration,
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: child,
              ),
              child: IndexedStack(
                index: state.bottomMenu.index,
                children: const [
                  HomePage(),
                  OrdersPage(),
                  FavoritesPage(),
                  ProfilePage()
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              key: Constants.bottomNavigatorKey,
              onTap: (i) {
                if (state.bottomMenu.index == 0 && i == 0) {
                  context.read<HomeBloc>().add(
                        const HomeScroll(isScrollingTop: true),
                      );
                  return;
                }
                if (i == 3 && !localSource.hasProfile) {
                  Navigator.pushNamed(context, Routes.auth);
                  return;
                }
                context
                    .read<MainBloc>()
                    .add(MainEventChanged(BottomMenu.values[i]));
              },
              currentIndex: state.bottomMenu.index,
              items: [
                _navigationBarItem(
                  label: context.translate('search'),
                  icon: AppIcons.search,
                  activeIcon: AppIcons.search,
                ),
                _navigationBarItem(
                  label: context.translate('orders'),
                  icon: AppIcons.history,
                  activeIcon: AppIcons.history,
                ),
                _navigationBarItem(
                  label: context.translate('favorites'),
                  icon: AppIcons.favorite,
                  activeIcon: AppIcons.favorite_1,
                ),
                _navigationBarItem(
                  label: context.translate('profile'),
                  icon: AppIcons.profile,
                  activeIcon: AppIcons.active_profile,
                ),
              ],
            ),
          ),
        ),
      );

  BottomNavigationBarItem _navigationBarItem({
    required String label,
    required IconData icon,
    required IconData activeIcon,
  }) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: Icon(icon),
        ),
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: Icon(activeIcon),
        ),
        label: label,
        tooltip: label,
      );
}
