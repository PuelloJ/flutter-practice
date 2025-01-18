import 'package:flutter/material.dart';
import 'package:image_gallery/config/utils.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/widgets/carousel_section.dart';
import 'package:image_gallery/widgets/image_grid.dart';

class HomeGalleryScreen extends StatefulWidget {
  const HomeGalleryScreen({
    super.key,
    required this.changeTheme,
    required this.darkMode,
  });

  final VoidCallback changeTheme;
  final bool darkMode;

  @override
  State<HomeGalleryScreen> createState() => _HomeGalleryScreenState();
}

class _HomeGalleryScreenState extends State<HomeGalleryScreen> {
  List<ImageModel> images = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    await Future.delayed(const Duration(seconds: 2));
    images = await getImages();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Galeria de imagenes",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: widget.changeTheme,
            icon: Icon(
              widget.darkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSection(
                  images: images,
                ),
                Expanded(
                  child: ImageGridSection(
                    images: images,
                  ),
                )
              ],
            ),
      floatingActionButton: const _FloatingButton(),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.add_a_photo_outlined),
      label: const Text('Agregar imagen'),
    );
  }
}
