import 'package:flutter/material.dart';

class HomeGalleryScreen extends StatelessWidget {
  const HomeGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 25, color: Colors.black),
        title: const Text("Galeria de imagenes"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Image Gallery 📷"),
            Image.asset("assets/images/gummy-apple-watch.png"),
          ],
        ),
      ),
    );
  }
}
