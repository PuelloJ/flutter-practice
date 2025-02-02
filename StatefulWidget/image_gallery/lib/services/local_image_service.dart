import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery/config/constants/constants.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/ui/widgets/custom_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

Future<List<ImageModel>> getLocalImages() async {
  List<ImageModel> images = [];
  List<Map<String, dynamic>> localImagesData = Constants.localImageData;

  for (var image in localImagesData) {
    images.add(ImageModel.fromJson(image));
  }

  return images;
}

Future<File?> pickAndSaveImage() async {
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final fileImage = File(pickedFile.path);
      return fileImage;
    }
  } catch (e) {
    throw Exception(e);
  }
  return null;
}

void onShareXFileAssets(BuildContext context, ImageModel image) async {
  final box = context.findRenderObject() as RenderBox?;
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  ByteData data = ByteData(0);
  ByteBuffer buffer = Uint8List(0).buffer;
  try {
    if (image.imageUrl != null) {
      data = await rootBundle.load(image.imageUrl!);
      buffer = data.buffer;
    }

    final List<XFile> files = image.imageUrl != null
        ? [
            XFile.fromData(
              buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
              name: "${image.name}.png",
              mimeType: 'image/png',
            ),
          ]
        : [
            XFile(
              image.imageFile!.path,
              name: "${image.name}.png",
              mimeType: 'image/png',
            )
          ];

    final shareResult = await Share.shareXFiles(
      files,
      text: "*${image.name}*\n${image.description.trim()}",
      subject: image.description,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
    CustomSnackBarShared.show(
      scaffoldMessenger,
      "${image.name}. Imagen compartida con éxito",
      additionalInfo: shareResult.status == ShareResultStatus.success
          ? "Compartida con: ${shareResult.raw}"
          : null,
    );
  } catch (e) {
    scaffoldMessenger.showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}
