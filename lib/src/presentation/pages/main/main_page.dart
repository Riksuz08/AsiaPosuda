import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/home/home_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: const [HomePage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i){},
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        backgroundColor: AppColors.white,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        unselectedItemColor: AppColors.greyBD,
        selectedItemColor: AppColors.blue,
        elevation: 2,
        iconSize: 24,
        currentIndex: 0,
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
