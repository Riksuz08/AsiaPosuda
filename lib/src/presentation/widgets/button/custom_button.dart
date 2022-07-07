import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color disabledColor;
  final Color fontColor;
  final String text;
  final Function()? onTap;
  final EdgeInsets padding;
  final double width;
  final double textSize;
  final double height;
  final BorderSide side;

  const CustomButton({
    Key? key,
    this.text = '',
    this.onTap,
    this.backgroundColor = AppColors.blue,
    this.disabledColor = AppColors.grey6F,
    this.fontColor = Colors.white,
    this.width = double.infinity,
    this.textSize = 17,
    this.height = 48,
    this.padding = EdgeInsets.zero,
    this.side = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return backgroundColor.withOpacity(0.7);
            }
            if (states.contains(MaterialState.disabled)) {
              return disabledColor;
            }
            return backgroundColor;
          },
        ),
        elevation: MaterialStateProperty.all<double>(0),
        textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: textSize, color: fontColor),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        padding: MaterialStateProperty.all(padding),
        fixedSize: MaterialStateProperty.all(Size(width, height)),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: textSize, color: fontColor),
      ),
    );
  }
}
