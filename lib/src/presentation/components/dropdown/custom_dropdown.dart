import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.label,
    this.hintText,
    this.currentFocus,
    this.nextFocus,
  });

  final T? value;
  final String? label;
  final String? hintText;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final FocusNode? currentFocus, nextFocus;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '$label',
                style: context.textStyle.bodySubheadline,
              ),
            ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: true,
              hint: Text(
                hintText ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff898F93),
                  fontWeight: FontWeight.w400,
                ),
              ),
              focusNode: currentFocus,
              onMenuStateChange: (isMenuOpen) {
                if (isMenuOpen) {
                  currentFocus?.unfocus();
                  nextFocus?.requestFocus();
                }
              },
              items: items,
              value: value,
              onChanged: onChanged,
              buttonStyleData: const ButtonStyleData(
                elevation: 0,
                padding: EdgeInsets.fromLTRB(0, 2, 12, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.fromBorderSide(
                    BorderSide(color: Color(0xFFC5D4DF)),
                  ),
                ),
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 300,
                padding: EdgeInsets.zero,
                scrollPadding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                openMenuIcon: Icon(
                  Icons.keyboard_arrow_up,
                ),
              ),
            ),
          ),
        ],
      );
}
