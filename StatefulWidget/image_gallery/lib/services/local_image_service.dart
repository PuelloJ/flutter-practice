import 'dart:io';

import 'package:image_gallery/config/constants/constants.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_picker/image_picker.dart';

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
