import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

import '../controllers/news_controller.dart';

final volunteeringMock = Volunteering(
    id: "id",
    image: imageUrl,
    name: "name",
    purpose: "purpose",
    description: "description",
    requirements: ["requirements"],
    disponibility: ["disponibility"],
    vacants: 5,
    address: "address",
    geolocation: const GeoPoint(0, 0),
    creation: Timestamp(108792, 908123));
