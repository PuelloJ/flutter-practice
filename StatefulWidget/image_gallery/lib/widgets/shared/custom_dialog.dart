import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/widgets/text_carousel_section.dart';
import 'package:intl/intl.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme.primary;

    return ZoomIn(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        clipBehavior: Clip.antiAlias,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        contentPadding: const EdgeInsets.all(0),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              image.favorite ? Icons.bookmark : Icons.bookmark_add_outlined,
              color: image.favorite ? color : null,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.file_download_outlined),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image.imageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _LabelImageInformation(
                          label: image.location,
                          textTheme: textTheme,
                          icon: Icons.location_on_outlined,
                        ),
                        const _CustomVerticalDivider(),
                        _LabelImageInformation(
                          label: DateFormat.yMd('es').format(image.date),
                          textTheme: textTheme,
                          icon: Icons.date_range_outlined,
                        ),
                        const _CustomVerticalDivider(),
                        _LabelImageInformation(
                          label: image.source,
                          textTheme: textTheme,
                          icon: Icons.source_outlined,
                        ),
                        const _CustomVerticalDivider(),
                        _LabelImageInformation(
                          label: image.camera,
                          textTheme: textTheme,
                          icon: Icons.camera_alt_outlined,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextSection(
                    label: image.name,
                    textStyle: textTheme.titleLarge?.copyWith(fontSize: 30),
                    maxLines: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: "By "),
                        TextSpan(
                          text: image.author,
                          style: TextStyle(
                            color: color,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                      style: textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextSection(
                    label: "Descripción",
                    textStyle: textTheme.titleMedium,
                  ),
                  CustomTextSection(
                    label: image.description,
                    textStyle: textTheme.labelSmall,
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
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

class _LabelImageInformation extends StatelessWidget {
  const _LabelImageInformation({
    required this.label,
    required this.textTheme,
    required this.icon,
  });

  final String label;
  final TextTheme textTheme;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        CustomTextSection(
          label: label,
          textStyle: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
