import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_icons.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import 'widgets/logout_dialog.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate('profile'))),
      body: CustomScrollView(
        slivers: [
          const SliverGap(16),
          SliverPadding(
            padding: AppUtils.kPaddingHorizontal16,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfileItemWidget(
                    icon: const Icon(
                      AppIcons.address_book,
                      size: 20,
                    ),
                    text: context.translate('notebook'),
                    isTop: true,
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.notes);
                    },
                  ),
                  const Divider(height: 1),
                  ProfileItemWidget(
                    icon: const Icon(
                      AppIcons.wallet,
                      size: 20,
                    ),
                    text: context.translate('my_cards'),
                    isBottom: true,
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.myCards);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SliverGap(12),
          SliverPadding(
            padding: AppUtils.kPaddingHorizontal16,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfileItemWidget(
                    icon: const Icon(
                      AppIcons.info,
                      size: 20,
                    ),
                    text: context.translate('about_us'),
                    isTop: true,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ProfileItemWidget(
                    icon: const Icon(
                      AppIcons.favorite_list,
                      size: 20,
                    ),
                    text: context.translate('blog'),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ProfileItemWidget(
                    icon: const Icon(
                      AppIcons.agreement,
                      size: 20,
                    ),
                    text: context.translate('cooperation'),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ProfileItemWidget(
                    icon: const Icon(
                      Icons.settings,
                      size: 20,
                    ),
                    text: context.translate('settings'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.settings,
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ProfileItemWidget(
                    icon: const Icon(
                      AppIcons.logout,
                      size: 20,
                    ),
                    isBottom: true,
                    text: context.translate('logout'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const LogOutDialog();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
