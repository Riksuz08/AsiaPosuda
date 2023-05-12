import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon? icon;
  final Function() onTap;
  final bool isTop;
  final bool isBottom;
  final bool isBottomButton;

  const SearchItem({
    Key? key,
    required this.title,
    required this.subTitle,
    this.icon,
    required this.onTap,
    this.isBottomButton = false,
    this.isTop = false,
    this.isBottom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.color.white,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: isTop ? const Radius.circular(12) : AppUtils.kRadius,
          topLeft: isTop ? const Radius.circular(12) : AppUtils.kRadius,
          bottomLeft: isBottom ? const Radius.circular(12) : AppUtils.kRadius,
          bottomRight: isBottom ? const Radius.circular(12) : AppUtils.kRadius,
        ),
      ),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: icon,
    );
  }
}
