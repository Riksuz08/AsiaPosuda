import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/data/source/THelperFunctions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,

  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = (THelperFunctions().getColor(text) !=null);
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      shape: isColor ? const CircleBorder() : null,
      avatar: isColor
          ? Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: THelperFunctions().getColor(text),
        ),
      )
          : null,
      labelPadding: isColor ? EdgeInsets.zero : null,
      padding: isColor ? EdgeInsets.zero : null,
      backgroundColor: isColor ? THelperFunctions().getColor(text) : null,
      selectedColor: Color(0xFF79B531),


    );

  }
}
