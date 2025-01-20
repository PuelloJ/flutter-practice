import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/widgets/shared/custom_dialog.dart';
import 'package:image_gallery/widgets/shared/custom_linear_gradient.dart';

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
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return _ImageCardDetail(image: image);
      },
    );
  }
}

class _ImageCardDetail extends StatelessWidget {
  const _ImageCardDetail({required this.image});
  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return FadeInUp(
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => showDialog(
            context: context,
            builder: (context) => CustomDialog(image: image),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  image.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const CustomLinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5],
                colors: [Colors.black38, Colors.transparent],
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.info_outline_rounded,
                  color: color.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
