import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/widgets/shared/custom_dialog.dart';

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
        return _ImageCardDetail(image: image);
      },
    );
  }
}

class _ImageCardDetail extends StatefulWidget {
  const _ImageCardDetail({
    required this.image,
  });
  final ImageModel image;

  @override
  State<_ImageCardDetail> createState() => _ImageCardDetailState();
}

class _ImageCardDetailState extends State<_ImageCardDetail> {
  double opacity = 1.0;

  void _changeOpacity(double value) {
    setState(() {
      opacity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return FadeInUp(
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: GestureDetector(
          onTap: () async {
            _changeOpacity(0.4);
            showDialog(
              context: context,
              builder: (context) => CustomDialog(image: widget.image),
            );
            await Future.delayed(const Duration(milliseconds: 200));
            _changeOpacity(1.0);
          },
          child: Stack(
            children: [
              Opacity(
                opacity: opacity,
                child: Image.asset(
                  widget.image.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: widget.image.favorite
                    ? Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: color.primaryContainer,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.bookmark,
                          color: color.primary,
                          size: 15,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
