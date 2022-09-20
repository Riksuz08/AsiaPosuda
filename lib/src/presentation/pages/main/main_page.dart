import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_icons.dart';
import 'package:sample_bloc_mobile/src/core/di/injection.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/core/utils/constants.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/bookmark/bookmark_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/home_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/profile_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/search/search_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children: const [
              HomePage(),
              SearchPage(),
              BookmarkPage(),
              ProfilePage()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            key: AppConstants.bottomNavigatorKey,
            onTap: (i) {
              mainBloc.add(MainEventChanged(BottomMenu.values[i]));
            },
            currentIndex: state.bottomMenu.index,
            items: [
              _buildMenuItem(
                icon: AppIcons.home,
                text: AppTranslations.of(context).home,
              ),
              _buildMenuItem(
                icon: AppIcons.search,
                text: AppTranslations.of(context).search,
              ),
              _buildMenuItem(
                icon: AppIcons.bookmark,
                text: AppTranslations.of(context).bookmark,
              ),
              _buildMenuItem(
                icon: AppIcons.profile,
                text: AppTranslations.of(context).profile,
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildMenuItem({
    required IconData icon,
    required String text,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 4),
        child: Icon(icon),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 4),
        child: Icon(icon),
      ),
      label: text,
    );
  }
}
