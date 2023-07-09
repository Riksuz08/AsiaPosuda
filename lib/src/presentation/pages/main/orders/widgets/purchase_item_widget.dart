import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/components/paint/horizontal_line_painter.dart';

class PurchaseItemWidget extends StatelessWidget {
  const PurchaseItemWidget({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80',
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AppUtils.kGap8,
                              const Text('20:50'),
                              AppUtils.kGap8,
                              const CustomPaint(
                                painter: HorizontalLine(),
                                size: Size(60, 16),
                              ),
                              AppUtils.kGap8,
                              const Text('20:50'),
                              AppUtils.kSpacer,
                              const Text(
                                '3 час 52',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 35),
                              const Expanded(
                                child: Text(
                                  'DME',
                                ),
                              ),
                              const SizedBox(width: 75),
                              const Expanded(
                                child: Text('DME'),
                              ),
                              AppUtils.kSpacer,
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'TJM',
                                    ),
                                    TextSpan(
                                      text: ' 40мин',
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          AppUtils.kGap8,
                          const Row(
                            children: [
                              Text('Turkish airlines'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                AppUtils.kGap12,
                const Divider(height: 1),
                AppUtils.kGap12,
                Row(
                  children: [
                    const Icon(Icons.share),
                    AppUtils.kGap16,
                    const Icon(Icons.favorite),
                    AppUtils.kSpacer,
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: context.theme.colorScheme.primary,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'от 2 806 000 UZS',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

class IconText extends StatelessWidget {
  const IconText({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Ink(
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: context.theme.primaryColor,
              size: 20,
            ),
            AppUtils.kGap6,
            Text(title),
          ],
        ),
      );
}
