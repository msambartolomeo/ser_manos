import 'package:image_picker/image_picker.dart';

abstract class ImageData {
  ImageData();

  Future<String> uploadProfileImage(String uid, XFile image);
}
