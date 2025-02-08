import 'package:flutter/material.dart';

class ItemTaskCategorySection extends StatelessWidget {
  const ItemTaskCategorySection({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.isHorizontal = false,
  });

  final Color color;
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isHorizontal
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              children: [
                Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                ),
                _BuildTextSection(
                  title: title,
                  textTheme: textTheme,
                  subtitle: subtitle,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                ),
                _BuildTextSection(
                  title: title,
                  textTheme: textTheme,
                  subtitle: subtitle,
                ),
              ],
            ),
    );
  }
}

class _BuildTextSection extends StatelessWidget {
  const _BuildTextSection({
    required this.title,
    required this.textTheme,
    required this.subtitle,
  });

  final String title;
  final TextTheme textTheme;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: textTheme.labelLarge!.copyWith(
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
