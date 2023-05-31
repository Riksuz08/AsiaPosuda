import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class SearchBannerWidget extends StatelessWidget {
  final PageController pageController;

  const SearchBannerWidget({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 126,
                  child: ColoredBox(
                    color: context.color.primary,
                  ),
                ),
              ),
              Positioned(
                child: SizedBox(
                  height: 168,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: AppUtils.kPaddingAllB16,
                        child: ClipRRect(
                          borderRadius: AppUtils.kBorderRadius12,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://a.cdn-hotels.com/gdcs/production85/d784/3a2d1bd9-05c4-414e-af06-a444d81a105b.jpg?impolicy=fcrop&w=800&h=533&q=medium',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          AppUtils.kBoxHeight12,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              1,
              (__) => Container(
                height: 8,
                width: 8,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.color.primary,
                  // color: index == __ ? context.color.primary : context.color.midGray3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
