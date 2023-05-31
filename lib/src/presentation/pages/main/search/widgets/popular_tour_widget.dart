import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class PopularTourWidget extends StatelessWidget {
  const PopularTourWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppUtils.kPaddingAll16,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            if (index.isEven) {
              return Theme(
                data: context.theme.copyWith(
                  disabledColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  shape: AppUtils.kShapeRoundedAll12,
                  collapsedShape: AppUtils.kShapeRoundedAll12,
                  tilePadding: AppUtils.kPaddingHorizontal12,
                  backgroundColor: context.color.scaffoldBackground,
                  collapsedBackgroundColor: context.color.scaffoldBackground,
                  title: const Text('Ташкент'),
                  subtitle: const Text('Ташкент'),
                  leading: ClipRRect(
                    borderRadius: AppUtils.kBorderRadius12,
                    child: CachedNetworkImage(
                      height: 56,
                      width: 56,
                      fit: BoxFit.fill,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSouNS7c7a9GUytu4faKljBLrIgKXtvZ6WAKVCsvb0wYOWfvuUeVR8mZtl5kX6NSew3r9Q&usqp=CAU',
                    ),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text(
                        'items.description',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              );
            }
            return AppUtils.kBoxHeight8;
          },
          childCount: 5.doubleTheListCount,
        ),
      ),
    );
  }
}
