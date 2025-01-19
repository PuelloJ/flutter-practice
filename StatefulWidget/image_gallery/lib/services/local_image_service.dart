import 'package:image_gallery/config/constants.dart';
import 'package:image_gallery/models/images.dart';


Future<List<ImageModel>> getLocalImages() async {
  List<ImageModel> images = [];

  for (var image in localImageData) {
    images.add(ImageModel.fromJson(image));
  }

  return images;
}
