import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/ui/ui.dart';

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({
    super.key,
    required this.imageInfo,
  });

  final ImageModel imageInfo;

  @override
  Widget build(BuildContext context) {
    final textTitle = Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white);
    final textBody = Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white);
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
