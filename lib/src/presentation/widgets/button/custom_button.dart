import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final String text;
  final Function()? onTap;
  final EdgeInsets margin;
  final double width;
  final double textSize;
  final double height;
  final BorderSide side;

  const CustomButton({
    Key? key,
    this.text = '',
    this.onTap,
    this.backgroundColor = AppColors.blue,
    this.fontColor = Colors.white,
    this.width = double.infinity,
    this.textSize = 17,
    this.height = 48,
    this.margin = EdgeInsets.zero,
    this.side = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      // ignore: deprecated_member_use
      child: OutlinedButton(

        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: fontColor,
              fontSize: textSize,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
