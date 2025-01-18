import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({
    super.key,
    required this.images,
  });

  final List<ImageModel> images;

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  CarouselController carouselController = CarouselController(initialItem: 1);

  @override
  void dispose() {
    carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height / 5),
      child: CarouselView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        controller: carouselController,
        itemSnapping: true,
        itemExtent: height * 0.3,
        children: _buildHeroLayoutCards(),
      ),
    );
  }

  List<Widget> _buildHeroLayoutCards() {
    return widget.images.map((image) {
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
    final double width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        ClipRect(
          child: OverflowBox(
            maxWidth: width,
            minWidth: width,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(imageInfo.imageUrl),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                imageInfo.name,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                imageInfo.description,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
