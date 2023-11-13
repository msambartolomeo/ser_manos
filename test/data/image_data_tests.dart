import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:ser_manos/data/image_data_impl.dart';
import 'package:ser_manos/data/interfaces/image_data.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late FirebaseStorage storage;
  late ImageData imageData;

  group("Image Data Testing", () {
    setUp(() async {
      storage = MockFirebaseStorage();

      imageData = ImageDataImplementation(firebaseStorage: storage);
    });

    test("Upload image", () async {
      await imageData.uploadProfileImage("uid", File(""));

      final storageRef = storage.ref().child("users");
      final listResult = await storageRef.listAll();
      expect(listResult.items.length, 1);
    });
  });
}
