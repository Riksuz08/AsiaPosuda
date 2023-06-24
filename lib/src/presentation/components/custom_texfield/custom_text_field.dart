import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool showError;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final int? maxLines;
  final int? minLines;
  final String? titleText;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool readOnly;
  final Color? fillColor;
  final bool? autofocus;
  final bool? enabled;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets textFieldPadding;
  final Function()? onComplete;
  final Function(String?)? validator;

  const CustomTextField({
    Key? key,
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
    this.textFieldPadding = AppUtils.kPadding0,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        Padding(
          padding: textFieldPadding,
          child: TextFormField(
            validator: (value) => validator!(value),
            textCapitalization: TextCapitalization.sentences,
            readOnly: readOnly,
            enabled: enabled ?? true,
            autofocus: autofocus ?? false,
            obscureText: obscureText ?? false,
            controller: controller,
            onTap: onTap,
            style: const TextStyle(
              fontSize: 14,
              height: 16 / 14,
              fontWeight: FontWeight.w400,
            ),
            textInputAction: inputAction ?? TextInputAction.next,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              errorText: showError ? errorText : null,
              errorStyle: TextStyle(fontSize: 13),
              hintText: hintText,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff22B99A), width: 1),
                borderRadius: AppUtils.kBorderRadius10,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                borderRadius: AppUtils.kBorderRadius10,
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: AppUtils.kBorderRadius10,
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: AppUtils.kBorderRadius10,
              ),
            ),
            cursorColor: context.theme.colorScheme.primary,
            keyboardType: keyboardType,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            inputFormatters: inputFormatters,
            onEditingComplete: onComplete,
          ),
        ),
      ],
    );
  }
}
