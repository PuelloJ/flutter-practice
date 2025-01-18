import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';

class ImageGridSection extends StatelessWidget {
  const ImageGridSection({
    super.key,
    required this.images,
  });

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return _ImageCardDetail(image: image);
        },
      ),
    );
  }
}

class _ImageCardDetail extends StatelessWidget {
  const _ImageCardDetail({required this.image});
  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Card(

      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Expanded(
        child: Image.asset(
          image.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
