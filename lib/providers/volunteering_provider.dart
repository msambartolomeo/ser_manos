import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part "generated/volunteering_provider.g.dart";

@riverpod
Future<Map<String, Volunteering>> fetchVolunteering(
    FetchVolunteeringRef ref) async {
  final firestore = ref.read(firebaseFirestoreProvider);
  final collection = firestore.collection("volunteering");
  final querySnapshot = await collection.get();

  Map<String, Volunteering> volunteeringMap =
      querySnapshot.docs.fold<Map<String, Volunteering>>({}, (map, doc) {
    final data = doc.data();
    final volunteering = Volunteering(
      name: data['name'],
      purpose: data['purpose'],
      image: data['image'],
      description: data['description'],
      vacants: data['vacants'],
      address: data['address'],
      requirements: List<String>.from(data['requirements']),
      disponibility: List<String>.from(data['disponibility']),
    );
    map[doc.id] = volunteering; // Usamos el ID del documento como clave
    return map;
  });

  return volunteeringMap;
}
