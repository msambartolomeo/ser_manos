import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/data/interfaces/image_data.dart';

class ImageDataImplementation implements ImageData {
  final FirebaseStorage firebaseStorage;

  ImageDataImplementation({required this.firebaseStorage});

  @override
  Future<String> uploadProfileImage(String uid, XFile image) async {
    final storageRef = firebaseStorage.ref();

    final imageRef = storageRef.child("users/$uid");

    try {
      await imageRef.putData(
        await image.readAsBytes(),
        SettableMetadata(
          contentType: "image/*",
        ),
      );
      return await imageRef.getDownloadURL();
    } on FirebaseException catch (_) {
      debugPrint("boom");
      rethrow;
    }
  }
}
