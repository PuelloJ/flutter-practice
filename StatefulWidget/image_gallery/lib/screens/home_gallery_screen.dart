import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery/config/constants.dart';

class HomeGalleryScreen extends StatefulWidget {
  const HomeGalleryScreen({super.key});

  @override
  State<HomeGalleryScreen> createState() => _HomeGalleryScreenState();
}

class _HomeGalleryScreenState extends State<HomeGalleryScreen> {
  final CarouselController carouselController =
      CarouselController(initialItem: 1);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(fontSize: 25),
        title: const Text("Galeria de imagenes"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode_rounded),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height / 3),
              child: CarouselView(
                backgroundColor: Colors.blueAccent,
                controller: carouselController,
                itemSnapping: true,

                // flexWeights: const <int>[1, 7, 1],
                itemExtent: height * 0.3,
                children: imageInfo.map((image) {
                  return HeroLayoutCard(imageInfo: image);
                }).toList(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: imageInfo.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> imagepath = imageInfo[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridTile(
                      header: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.info_outline_rounded),
                      ),
                      footer: Text(
                        imagepath['name'],
                        textAlign: TextAlign.center,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(imagepath['imageUrl']),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({
    super.key,
    required this.imageInfo,
  });

  final Map<String, dynamic> imageInfo;

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
              image: AssetImage(imageInfo['imageUrl']),
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
                imageInfo['name'],
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "Subtitulo",
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
