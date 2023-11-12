import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ser_manos/data/interfaces/image_data.dart';

class ImageDataImplementation implements ImageData {
  final FirebaseStorage firebaseStorage;

  ImageDataImplementation({required this.firebaseStorage});

  @override
  Future<String> uploadProfileImage(String uid, File image) async {
    final storageRef = firebaseStorage.ref();

    final imageRef = storageRef.child("users/$uid");

    try {
      await imageRef.putFile(
        image,
        SettableMetadata(
          contentType: "image/*",
        ),
      );
      return await imageRef.getDownloadURL();
    } on FirebaseException catch (_) {
      // TODO: Handle error
      rethrow;
    }
  }
}
