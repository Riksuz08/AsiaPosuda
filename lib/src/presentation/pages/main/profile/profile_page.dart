

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/widgets/logout_dialog.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/widgets/profile_item_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/config.dart';
import '../../../../config/router/app_routes.dart';
import '../../../../core/services/http_service.dart';
import '../../../../core/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController? _tabController;
  final HttpService httpService = HttpService();


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    loadDataAndFetchUser();
  }

  Future<void> loadDataAndFetchUser() async {
    final String email = await loadData();
    await httpService.getUser(email);
  }

  Future<String> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            delegate: _SearchBarDelegate(),
            pinned: true,
          ),
        ],
        body: CustomScrollView(
          slivers: [
            const SliverGap(16),
            SliverPadding(
              padding: AppUtils.kPaddingHorizontal16,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ProfileItemWidget(
                      icon:const Icon(Icons.shopping_bag),
                      text:context.tr('my_orders'),
                      isTop: true,
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.notes);
                      },
                    ),
                    const Divider(height: 1),
                    ProfileItemWidget(
                      icon:const Icon(Icons.emoji_emotions),
                      text: context.tr('my_reviews'),
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
                      icon:const Icon(Icons.chat),
                      text: context.tr('my_chats'),
                      isTop: true,
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ProfileItemWidget(
                      icon:const Icon(Icons.notifications),
                      text: context.tr('notifications'),
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ProfileItemWidget(
                      icon:const Icon(Icons.mail),
                      text: context.tr('contact_with_us'),
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ProfileItemWidget(
                      icon: const Icon(
                        Icons.settings,
                        size: 20,
                      ),
                      text: context.tr('settings'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.settings,
                        );
                      },
                    ),
                    const Divider(height: 1),
                    ProfileItemWidget(
                      icon:const Icon(Icons.logout),
                      isBottom: true,
                      text: context.tr('logout'),
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (_) => const LogOutDialog(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:  AssetImage('assets/png/profilimage.png'), // Set the background image URL
          fit: BoxFit.cover,

        ),
      ),
      padding: const EdgeInsets.only(left: 20, right: 10, top: 30, bottom: 10),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
               const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYscfUBUbqwGd_DHVhG-ZjCOD7MUpxp4uhNe7toUg4ug&s',

              ),
               ),
              SizedBox(width: 20),
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                    Config.nameUser.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Obx(() => Text(
                    Config.phoneUser.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              )// Add space between avatar and name

            ],
          ),
        ],
      ),
    );

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}


