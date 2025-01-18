import 'package:image_gallery/config/constants.dart';
import 'package:image_gallery/models/images.dart';

/// Fetches a list of images asynchronously.
///
/// This function retrieves image data from a local source, converts each
/// image data to an `ImageModel` object, and returns a list of these objects.
///
/// Returns:
///   A `Future` that completes with a list of `ImageModel` objects.
Future<List<ImageModel>> getImages() async {
  List<ImageModel> images = [];

  for (var image in localImageData) {
    images.add(ImageModel.fromJson(image));
  }

  return images;
}
