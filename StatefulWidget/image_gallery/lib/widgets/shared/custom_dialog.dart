import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        clipBehavior: Clip.antiAlias,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        icon: const Icon(Icons.photo_library_outlined),
        title: Column(
          children: [
            Text(image.name),
            Text(
              image.description,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_border_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.file_download_outlined)),
        ],
        content: Image.asset(
          image.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
