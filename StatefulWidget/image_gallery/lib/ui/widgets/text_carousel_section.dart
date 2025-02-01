import 'package:flutter/material.dart';

class CustomTextSection extends StatelessWidget {
  const CustomTextSection({
    super.key,
    required this.label,
    required this.textStyle,
    this.maxLines = 1,
  });

  final String label;
  final TextStyle? textStyle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: textStyle,
    );
  }
}
