import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import 'search_item.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ColoredBox(
            color: context.color.primary,
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: Stack(
                children: [
                  Material(
                    shape: AppUtils.kShapeRoundedAll12,
                    child: Column(
                      children: [
                        SearchItem(
                          isTop: true,
                          title: 'Откуда',
                          subTitle: 'Москва (DME)',
                          onTap: () async {},
                        ),
                        const Divider(height: 1),
                        SearchItem(
                          title: 'Куда',
                          subTitle: 'Ташкент (TAS) ',
                          onTap: () {},
                        ),
                        const Divider(height: 1),
                        SearchItem(
                          title: 'Туда',
                          subTitle: '8 апр.2023',
                          icon: Icon(
                            Icons.calendar_today,
                            color: context.color.primary,
                          ),
                          onTap: () {},
                        ),
                        const Divider(height: 1),
                        SearchItem(
                          title: 'Пассажир',
                          subTitle: '2 гостей',
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                          ),
                          onTap: () {},
                        ),
                        const Divider(height: 1),
                        ListTile(
                          shape: AppUtils.kShapeRoundedBottom12,
                          title: ElevatedButton(
                            onPressed: () async {},
                            child: const Text('Найти'),
                          ),
                        ),
                      ],
                    ),
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
