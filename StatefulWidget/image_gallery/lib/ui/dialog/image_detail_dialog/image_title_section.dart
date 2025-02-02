import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';

class ImageTitleSection extends StatelessWidget {
  const ImageTitleSection({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: image.imageUrl != null
          ? Image.asset(
              image.imageUrl!,
              fit: BoxFit.cover,
            )
          : Image.file(
              image.imageFile!,
              fit: BoxFit.cover,
            ),
    );
  }
}