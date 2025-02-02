import 'package:flutter/material.dart';

import 'package:image_gallery/ui/grid/image_card_detail.dart';
import 'package:image_gallery/models/images.dart';

class ImageGridSection extends StatelessWidget {
  const ImageGridSection({
    super.key,
    required this.images,
  });

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return ImageCardDetail(image: image);
      },
    );
  }
}
