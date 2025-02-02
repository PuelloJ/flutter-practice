import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/ui/ui.dart';
import 'list_image_detail_content.dart';

class ImageContentSection extends StatelessWidget {
  const ImageContentSection({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              LabelImageInformation(
                label: DateFormat.yMd('es').format(image.date),
                textTheme: textTheme,
                icon: Icons.date_range_outlined,
                divider: false,
              ),
              LabelImageInformation(
                label: image.location,
                textTheme: textTheme,
                icon: Icons.location_on_outlined,
              ),
              LabelImageInformation(
                label: image.source,
                textTheme: textTheme,
                icon: Icons.source_outlined,
              ),
              LabelImageInformation(
                label: image.camera,
                textTheme: textTheme,
                icon: Icons.camera_alt_outlined,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
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
        const SizedBox(height: 15),
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
    );
  }
}
