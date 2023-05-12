import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class TabIcon extends StatelessWidget {
  final bool isTabSelected;
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const TabIcon({
    Key? key,
    required this.isTabSelected,
    required this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        borderRadius: AppUtils.kBorderRadius10,
        child: Ink(
          height: 32,
          padding: AppUtils.kPaddingAll8,
          decoration: BoxDecoration(
            color: isTabSelected
                ? context.color.white
                : context.color.white.withOpacity(0.12),
            borderRadius: AppUtils.kBorderRadius10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isTabSelected
                    ? context.color.secondary
                    : context.color.white,
                size: 16,
              ),
              AppUtils.kGap8,
              Text(
                text,
                style: TextStyle(
                  color: isTabSelected
                      ? context.color.secondary
                      : context.color.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
