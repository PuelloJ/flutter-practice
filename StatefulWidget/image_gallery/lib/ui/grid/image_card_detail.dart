import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/ui/ui.dart';

class ImageCardDetail extends StatefulWidget {
  const ImageCardDetail({
    super.key,
    required this.image,
  });
  final ImageModel image;

  @override
  State<ImageCardDetail> createState() => _ImageCardDetailState();
}

class _ImageCardDetailState extends State<ImageCardDetail> {
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
              builder: (context) => CustomDialog(
                image: widget.image,
              ),
            );
            await Future.delayed(const Duration(milliseconds: 200));
            _changeOpacity(1.0);
          },
          child: Stack(
            children: [
              Opacity(
                  opacity: opacity,
                  child: SizedBox.expand(
                    child: widget.image.imageUrl != null
                        ? Image.asset(
                            widget.image.imageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            widget.image.imageFile!,
                            fit: BoxFit.cover,
                          ),
                  )),
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
