import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/services/local_image_service.dart';
import 'package:image_gallery/ui/carousel/carousel_section.dart';
import 'package:image_gallery/ui/grid/image_grid.dart';
import 'package:image_gallery/ui/dialog/image_form_dialog/custom_dialog_form.dart';

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

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    await Future.delayed(const Duration(seconds: 2));
    images = await getLocalImages();
    setState(() {});
  }

  void _addImage(ImageModel image) {
    setState(() {
      images.add(image);
    });
  }

  // TODO: Implement _changeFavorite with a state management solution
  void _changeFavorite(int index) {
    setState(() {
      images[index].toggleFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 6.0,
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
      body: images.isEmpty
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
                  child: ImageGridSection(images: images),
                )
              ],
            ),
      floatingActionButton: _FloatingButton(_addImage),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton(this._addImage);

  final void Function(ImageModel image) _addImage;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: const Icon(Icons.add_a_photo_outlined),
      label: const Text('AGREGAR IMAGEN'),
      onPressed: () => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomDialogForm(
          addImage: _addImage,
        ),
      ),
    );
  }
}
