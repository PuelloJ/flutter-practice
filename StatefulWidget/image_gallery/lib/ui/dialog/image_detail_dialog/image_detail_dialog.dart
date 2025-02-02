import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/services/local_image_service.dart';
import 'package:image_gallery/ui/dialog/image_detail_dialog/image_content_sections.dart';
import 'package:image_gallery/ui/dialog/image_detail_dialog/image_title_section.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return ZoomIn(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        scrollable: true,
        clipBehavior: Clip.antiAlias,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        titlePadding: const EdgeInsets.all(0),
        title: ImageTitleSection(image: image),
        content: ImageContentSection(image: image),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              image.favorite ? Icons.bookmark : Icons.bookmark_add_outlined,
              color: image.favorite ? color : null,
            ),
          ),
          IconButton(
            onPressed: () {
              onShareXFileAssets(context, image);
            },
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {
              // TODO: Implement download image
            },
            icon: const Icon(Icons.file_download_outlined),
          ),
        ],
      ),
    );
  }
}
