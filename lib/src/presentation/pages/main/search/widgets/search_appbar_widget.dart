import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import 'tab_icons.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor: context.color.primary,
      toolbarHeight: 110,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: context.translate('your_journey_starts_here'),
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          children: const [
            TextSpan(
              text: '\nНужно забронировать деловую поездку? Пойдем!',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: AppUtils.kPaddingHor16Ver12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabIcon(
                onTap: () {},
                icon: AppIcons.avia,
                isTabSelected: true,
                text: 'Авиа',
              ),
              AppUtils.kGap4,
              TabIcon(
                onTap: () {},
                icon: AppIcons.calving,
                isTabSelected: false,
                text: 'Отели',
              ),
              AppUtils.kGap4,
              TabIcon(
                onTap: () {},
                icon: AppIcons.railway,
                isTabSelected: false,
                text: 'Ж/д билеты',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
