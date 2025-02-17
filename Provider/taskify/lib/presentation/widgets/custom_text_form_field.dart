import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final int? maxLine;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool? readOnly;
  final Widget? suffixIcon;
  TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Future<void> Function()? selectDate;

  CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.maxLine,
    this.style,
    this.readOnly = false,
    this.selectDate,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.black54),
    );

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: style,
      maxLines: maxLine,
      readOnly: readOnly!,
      onTap: selectDate,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        hintStyle: TextStyle(
          color: suffixIcon != null ? Colors.black : Colors.black54,
        ),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        // label: label != null ? Text(label!) : null,
        labelText: label,
        hintText: hint,
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.black,
        errorText: errorMessage,
        focusColor: colors.primary,
      ),
    );
  }
}
