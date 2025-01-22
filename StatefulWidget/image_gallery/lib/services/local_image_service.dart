import 'dart:io';

import 'package:image_gallery/config/constants.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<List<ImageModel>> getLocalImages() async {
  List<ImageModel> images = [];

  for (var image in localImageData) {
    images.add(ImageModel.fromJson(image));
  }

  return images;
}

Future<File?> pickAndSaveImage() async {
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Obtener el directorio donde guardar la imagen
    
      final fileImage = File(pickedFile.path);

      // Guardar la imagen en el directorio
      return fileImage;
    }
  } catch (e) {
    print('Error al seleccionar la imagen: $e');
  }
  return null;
}
