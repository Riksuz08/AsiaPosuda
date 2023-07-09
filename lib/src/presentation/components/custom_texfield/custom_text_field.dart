import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.errorText,
    this.showError = false,
    this.controller,
    this.keyboardType,
    this.inputAction,
    this.maxLines,
    this.onChanged,
    this.inputFormatters,
    this.obscureText,
    this.suffixIcon,
    this.titleText,
    this.enabled,
    this.onTap,
    this.readOnly = false,
    this.fillColor,
    this.minLines,
    this.onComplete,
    this.validator,
    this.autofocus,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.contentPadding,
    this.haveBorder = true,
    this.style,
    this.filled,
  });

  final String? hintText;
  final String? errorText;
  final bool showError;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final int? maxLines;
  final int? minLines;
  final String? titleText;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool readOnly;
  final Color? fillColor;
  final bool? autofocus;
  final bool? enabled;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onComplete;
  final String Function(String?)? validator;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final EdgeInsets? contentPadding;
  final bool haveBorder;
  final TextStyle? style;
  final bool? filled;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (titleText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '$titleText',
                style: const TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          TextFormField(
            validator: (value) => validator!(value),
            textCapitalization: TextCapitalization.sentences,
            readOnly: readOnly,
            enabled: enabled ?? true,
            autofocus: autofocus ?? false,
            obscureText: obscureText ?? false,
            controller: controller,
            onTap: onTap,
            style: style ??
                const TextStyle(
                  fontSize: 14,
                  height: 16 / 14,
                  fontWeight: FontWeight.w400,
                ),
            textInputAction: inputAction ?? TextInputAction.next,
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: filled,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              errorText: showError ? errorText : null,
              errorStyle: const TextStyle(fontSize: 13),
              hintText: hintText,
              contentPadding: contentPadding,
              focusedBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? const BorderSide(color: Color(0xff22B99A))
                    : BorderSide.none,
                borderRadius: AppUtils.kBorderRadius10,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? BorderSide(color: Colors.grey.shade300)
                    : BorderSide.none,
                borderRadius: AppUtils.kBorderRadius10,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? const BorderSide(color: Colors.red)
                    : BorderSide.none,
                borderRadius: AppUtils.kBorderRadius10,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? const BorderSide(color: Colors.red)
                    : BorderSide.none,
                borderRadius: AppUtils.kBorderRadius10,
              ),
              prefixText: prefixText,
              prefixStyle: prefixStyle,
            ),
            cursorColor: context.theme.colorScheme.primary,
            keyboardType: keyboardType,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            inputFormatters: inputFormatters,
            onEditingComplete: onComplete,
          ),
        ],
      );
}
