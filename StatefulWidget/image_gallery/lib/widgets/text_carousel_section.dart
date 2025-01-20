import 'package:flutter/material.dart';

class CustomTextSection extends StatelessWidget {
  const CustomTextSection({
    required this.label,
    this.textStyle,
    super.key,
  });

  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      overflow: TextOverflow.clip,
      softWrap: false,
      style: textStyle,
    );
  }
}
