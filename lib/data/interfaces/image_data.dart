import 'dart:io';

abstract class ImageData {
  ImageData();

  Future<String> uploadProfileImage(String uid, File image);
}
