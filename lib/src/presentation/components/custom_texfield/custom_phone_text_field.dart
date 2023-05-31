import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medion_client_mobile/src/config/themes/app_colors.dart';

class CustomPhoneTextField extends StatefulWidget {
  final String? titleText;
  final String? labelText;
  final bool? showError;
  final TextEditingController controller;
  final bool autoFocus;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final bool? obscureText;
  final BuildContext? context;
  final Function()? onTap, onComplete;
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
  final Function(String?)? validator;

  const CustomPhoneTextField({
    Key? key,
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
  }) : super(key: key);

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  String? _prefixText;
  var focusNode = FocusNode();

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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.titleText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              "${widget.titleText}",
              style: const TextStyle(
                fontSize: 12,
                height: 14 / 12,
                color: AppColors.text1,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        TextFormField(
          validator:(value) => widget.validator!(value),
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
          textCapitalization: TextCapitalization.none,
          onChanged: widget.onChanged,
          onFieldSubmitted: (term) => _fieldFocusChange(
            context,
            focusNode,
            widget.nextFocus,
          ),
          obscuringCharacter: '*',
          textInputAction: widget.inputAction,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
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
          cursorColor: AppColors.assets,
          keyboardType: widget.keyboardType,
          onEditingComplete: widget.onComplete,
        ),
      ],
    );
  }

  _fieldFocusChange(
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
