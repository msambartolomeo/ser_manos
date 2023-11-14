import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/controllers/application_controllers.dart';
import 'package:ser_manos/controllers/favorites_controller.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/models/models.dart';

import '../models/volunteering_mock.dart';

class VolunteeringControllerMock extends VolunteeringController {
  @override
  List<Volunteering> build(GeoPoint? geolocation) {
    return List.filled(3, volunteeringMock);
  }
}

class FavoritesControllerMock extends FavoritesController {
  @override
  List<String> build() {
    return List.filled(1, volunteeringMock.id);
  }
}

class ApplicationControllerMock extends ApplicationController {
  @override
  Application? build() {
    return null;
  }
}

Future<Volunteering> volunteeringGetByIdControllerMock(
  VolunteeringGetByIdControllerRef ref,
  String id,
) async {
  return volunteeringMock;
}

Stream<Map<String, int>> volunteeringStreamProviderMock(ref) {
  return Stream.value({volunteeringMock.id: 42});
}
