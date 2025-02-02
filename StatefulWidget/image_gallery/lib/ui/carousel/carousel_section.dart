import 'package:flutter/material.dart';

import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/ui/ui.dart';

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
      constraints: BoxConstraints(
        maxHeight: height / 5,
      ),
      child: CarouselView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        itemSnapping: true,
        itemExtent: height * 0.3,
        onTap: (value) {
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
              image: images.where((image) => image.favorite).elementAt(value),
            ),
          );
        },
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
