import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class SelectLangButton extends StatelessWidget {
  final Function() onPressed;
  final String flag;
  final String lang;
  final bool isSelected;

  const SelectLangButton({
    Key? key,
    required this.onPressed,
    required this.flag,
    required this.lang,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFEDEFF2),
        ),
        padding: AppUtils.kPaddingHor16Ver24,
        child: SizedBox(
          height: 24,
          child: Row(
            children: [
               Image(
                image: AssetImage(flag),
                height: 24,
                width: 36,
              ),
              AppUtils.kBoxWidth16,
              Text(
                lang,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2A2828),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
