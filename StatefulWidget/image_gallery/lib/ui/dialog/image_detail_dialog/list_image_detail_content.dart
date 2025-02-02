import 'package:flutter/material.dart';

import 'package:image_gallery/ui/ui.dart';

class LabelImageInformation extends StatelessWidget {
  const LabelImageInformation({
    super.key,
    required this.label,
    required this.textTheme,
    required this.icon,
    this.divider = true,
  });

  final String? label;
  final TextTheme textTheme;
  final IconData icon;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return label != null && label!.isNotEmpty
        ? Row(
            children: [
              divider ? const _CustomVerticalDivider() : const SizedBox(),
              Icon(
                icon,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomTextSection(
                label: label!,
                textStyle: textTheme.bodyMedium,
              ),
            ],
          )
        : const SizedBox();
  }
}

class _CustomVerticalDivider extends StatelessWidget {
  const _CustomVerticalDivider();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: 15,
      height: 10,
      child: VerticalDivider(
        thickness: 2,
        endIndent: 0,
        color: color,
      ),
    );
  }
}
