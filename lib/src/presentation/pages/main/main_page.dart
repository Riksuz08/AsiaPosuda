import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/fade_indexed_stack/animated_fade_indexed_stack.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/site/site.dart';

import 'favorites/bookmark_page.dart';
import 'home/home_page.dart';
import 'orders/orders_page.dart';
import 'profile/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<MainBloc, MainState, BottomMenu>(
        selector: (state) => state.bottomMenu,
        builder: (_, bottomMenu) => WillPopScope(
          onWillPop: () async {
            if (bottomMenu.index != 0) {
              context
                  .read<MainBloc>()
                  .add(MainEventChanged(BottomMenu.values[0]));
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: FadeIndexedStack(
              index: bottomMenu.index,
              children: const [
                HomePage(),
                OrdersPage(),
                FavoritesPage(),
                Site(),
                ProfilePage()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              key: Constants.bottomNavigatorKey,
              onTap: (i) {
                if (bottomMenu.index == 0 && i == 0) {
                  context.read<HomeBloc>().add(
                        const HomeScroll(isScrollingTop: true),
                      );
                  return;
                }

                if (i == 4 && !localSource.hasProfile) {
                  Navigator.pushNamed(context, Routes.register);
                  return;
                }

                context
                    .read<MainBloc>()
                    .add(MainEventChanged(BottomMenu.values[i]));
              },
              currentIndex: bottomMenu.index,
              selectedItemColor: const Color(
                  0xFF79B531), // Change the color of the selected item
              unselectedItemColor:
                  Colors.grey, // Change the color of unselected items
              selectedLabelStyle: TextStyle(
                  color: Color(
                      0xFF79B531)), // Change the text color of the selected label
              unselectedLabelStyle: TextStyle(color: Colors.grey),
              items: [
                _navigationBarItem(
                  label: context.tr('main'),
                  icon: 'assets/png/asia.png',
                  activeIcon: 'assets/png/asia.png',
                ),
                _navigationBarItem(
                  label: context.tr('catalog'),
                  icon: 'assets/png/search.png',
                  activeIcon: 'assets/png/search.png',
                ),
                _navigationBarItem(
                  label: context.tr('cart'),
                  icon: 'assets/png/bag.png',
                  activeIcon: 'assets/png/bag.png',
                ),
                _navigationBarItem(
                  label: context.tr('site'),
                  icon: 'assets/png/aksiya.png',
                  activeIcon: 'assets/png/aksiya.png',
                ),
                _navigationBarItem(
                  label: context.tr('profile'),
                  icon: 'assets/png/user.png',
                  activeIcon: 'assets/png/user.png',
                ),
              ],
            ),
          ),
        ),
      );

  BottomNavigationBarItem _navigationBarItem({
    required String label,
    required String icon,
    required String activeIcon,
  }) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: ImageIcon(AssetImage(icon)),
        ),
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: ImageIcon(AssetImage(activeIcon)),
        ),
        label: label,
        tooltip: label,
      );
}
