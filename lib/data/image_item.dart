import 'dart:async';
import 'package:flutter/cupertino.dart'hide Image;
import 'package:flutter/foundation.dart' show Uint8List ;
class ImageItem {
  int width = 300;
  int height = 300;
  Uint8List bytes = Uint8List.fromList([]);
  Completer loader = Completer();

  ImageItem([dynamic img]) {
    if (img != null) load(img);
  }

  Future load(dynamic imageFile) async {
    loader = Completer();

    if (imageFile is ImageItem) {
      height = imageFile.height;
      width = imageFile.width;

      bytes = imageFile.bytes;
      loader.complete(true);
    } else {
      bytes =
          imageFile is Uint8List ? imageFile : await imageFile.readAsBytes();
      var decodedImage = await decodeImageFromList(bytes);

      // image was decoded
      // print(['height', viewportSize.height, decodedImage.height]);
      height = decodedImage.height;
      width = decodedImage.width;
      /*print('nedir ilk $height');
      print('nedirw ilk $width');
      ui.Image? edene = ui.decodeImage(bytes);
      final ede = copyResize(edene!,height: 1024,width: 768);*/
      loader.complete(decodedImage);
    }

    return true;
  }

  static ImageItem fromJson(Map json) {
    var image = ImageItem(json['image']);

    image.width = json['width'];
    image.height = json['height'];

    return image;
  }

  Map toJson() {
    return {
      'height': height,
      'width': width,
      'bytes': bytes,
    };
  }
}
