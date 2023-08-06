import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField({
    super.key,
    this.titleText,
    this.showError,
    required this.controller,
    this.autoFocus = false,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.errorText,
    this.inputAction,
    this.currentFocus,
    this.nextFocus,
    this.obscureText,
    this.hintText,
    this.context,
    this.onTap,
    this.readOnly = false,
    this.suffixText,
    this.suffixIcon,
    this.suffixStyle,
    this.prefixIcon,
    this.inputFormatters,
    this.fillColor,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.onComplete,
    this.required = false,
    this.labelText,
    this.validator,
    this.filled,
    this.haveBorder = true,
  });

  final String? titleText;
  final String? labelText;
  final bool? showError;
  final TextEditingController controller;
  final bool autoFocus;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final bool? obscureText;
  final BuildContext? context;
  final void Function()? onTap, onComplete;
  final bool readOnly;
  final String? suffixText;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? suffixStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder,
      enabledBorder,
      errorBorder,
      focusedErrorBorder;
  final bool required;
  final String Function(String?)? validator;
  final bool? filled;
  final bool haveBorder;

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  String? _prefixText;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          _prefixText = '+998 ';
        });
      } else {
        if (widget.controller.text.isEmpty) {
          setState(() {
            _prefixText = null;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.titleText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '${widget.titleText}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          TextFormField(
            validator: (value) => widget.validator!(value),
            inputFormatters: widget.inputFormatters,
            style: const TextStyle(
              fontSize: 14,
              height: 16 / 14,
              fontWeight: FontWeight.w400,
            ),
            obscureText: widget.obscureText ?? false,
            readOnly: widget.readOnly,
            controller: widget.controller,
            focusNode: focusNode,
            onTap: widget.onTap,
            scrollPadding: EdgeInsets.zero,
            autofocus: widget.autoFocus,
            onChanged: widget.onChanged,
            onFieldSubmitted: (term) => _fieldFocusChange(
              context,
              focusNode,
              widget.nextFocus,
            ),
            obscuringCharacter: '*',
            textInputAction: widget.inputAction,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              fillColor: widget.fillColor,
              filled: widget.filled,
              suffixIcon: widget.suffixIcon,
              labelText: widget.labelText,
              prefixText: _prefixText,
              prefixIconConstraints: BoxConstraints(
                maxWidth: _prefixText != null ? 56 : 12,
                minWidth: _prefixText != null ? 48 : 12,
              ),
              hintText: _prefixText == null ? widget.hintText : '',
              errorText: widget.showError ?? false ? widget.errorText : null,
            ),
            cursorColor: context.theme.colorScheme.primary,
            keyboardType: widget.keyboardType,
            onEditingComplete: widget.onComplete,
          ),
        ],
      );

  void _fieldFocusChange(
    BuildContext context,
    FocusNode? currentFocus,
    FocusNode? nextFocus,
  ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}
