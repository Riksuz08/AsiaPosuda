import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/presentation/components/loading_widgets/custom_circular_progress_indicator.dart';

class SummaryTour extends StatelessWidget {
  const SummaryTour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 24),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Сбежать в лето",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 202,
              child: ListView.separated(
                padding: AppUtils.kPaddingHorizontal16,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: AppUtils.kBorderRadius12,
                        child: CachedNetworkImage(
                          height: 130,
                          width: 290,
                          placeholder: (_, __) =>
                              const CustomCircularProgressIndicator(),
                          imageUrl:
                              "https://media.timeout.com/images/105237890/750/562/image.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        "Ташкент — Москва",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "от 2 890 000 UZS",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64686b),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) {
                  return AppUtils.kBoxWidth12;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
