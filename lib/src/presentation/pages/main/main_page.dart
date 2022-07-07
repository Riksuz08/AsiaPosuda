import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/home_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children: const [HomePage(), ProfilePage()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (i) {
              context
                  .read<MainBloc>()
                  .add(MainEventChanged(BottomMenu.values[i]));
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            backgroundColor: AppColors.white,
            unselectedFontSize: 12,
            selectedFontSize: 12,
            unselectedItemColor: AppColors.greyBD,
            selectedItemColor: AppColors.blue,
            elevation: 2,
            iconSize: 24,
            currentIndex: state.bottomMenu.index,
            items: [
              _buildMenuItem(
                icon: Icons.home,
                text: AppTranslations.of(context).home,
              ),
              _buildMenuItem(
                icon: Icons.person,
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
        padding: const EdgeInsets.only(bottom: 2, top: 4),
        child: Icon(icon),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 2, top: 4),
        child: Icon(icon),
      ),
      label: text,
    );
  }
}
