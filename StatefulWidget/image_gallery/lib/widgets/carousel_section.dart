import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/widgets/shared/custom_dialog.dart';
import 'package:image_gallery/widgets/shared/custom_linear_gradient.dart';
import 'package:image_gallery/widgets/text_carousel_section.dart';

class CarouselSection extends StatelessWidget {
  const CarouselSection({
    super.key,
    required this.images,
  });

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height / 5),
      child: CarouselView(
        onTap: (value) {
          showGeneralDialog(
              context: context,
              barrierDismissible: false,
              pageBuilder: (ctx, anim1, anim2) => CustomDialog(
                image: images.where((image) => image.favorite).elementAt(value),
              ),
              transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                child: FadeTransition(
                  opacity: anim1,
                  child: child,
                ),
              ),
            );
        },
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        itemSnapping: true,
        itemExtent: height * 0.3,
        children: _buildHeroLayoutCards(),
      ),
    );
  }

  List<Widget> _buildHeroLayoutCards() {
    return images.where((image) => image.favorite).map((image) {
      return HeroLayoutCard(imageInfo: image);
    }).toList();
  }
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({
    super.key,
    required this.imageInfo,
  });

  final ImageModel imageInfo;

  @override
  Widget build(BuildContext context) {
    final textTitle =
        Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white);
    final textBody =
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white);

    final double width = MediaQuery.sizeOf(context).width;

    return ZoomIn(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            clipBehavior: Clip.antiAlias,
            child: OverflowBox(
              maxWidth: width,
              minWidth: width,
              child: imageInfo.imageUrl != null
                  ? Image(
                      fit: BoxFit.cover,
                      image: AssetImage(imageInfo.imageUrl!),
                    )
                  : Image(
                      image: FileImage(
                        imageInfo.imageFile!,
                      ),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const CustomLinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 1.0],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomTextSection(
                  label: imageInfo.name,
                  textStyle: textTitle,
                ),
                const SizedBox(height: 10),
                CustomTextSection(
                  label: imageInfo.description,
                  textStyle: textBody,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
