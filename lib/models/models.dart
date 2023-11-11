import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'generated/models.freezed.dart';
part 'generated/models.g.dart';

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}

class TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp time) {
    return time;
  }

  @override
  Timestamp toJson(Timestamp time) => time;
}

@freezed
class Volunteering with _$Volunteering {
  const factory Volunteering({
    required String image,
    required String name,
    required String purpose,
    required String description,
    required List<String> requirements,
    required List<String> disponibility,
    required int vacants,
    required String address,
    @GeoPointConverter() required GeoPoint geolocation,
    @TimestampConverter() required Timestamp creation,
  }) = _Volunteering;

  factory Volunteering.fromJson(Map<String, dynamic> json) =>
      _$VolunteeringFromJson(json);

  const Volunteering._();

  bool hasVacancies() {
    return vacants > 0;
  }

  double distanceToVolunteering(Volunteering other) {
    return distanceTo(other.geolocation);
  }

  double distanceTo(GeoPoint other) {
    return Geolocator.distanceBetween(geolocation.latitude,
        geolocation.longitude, other.latitude, other.longitude);
  }

  int compareCreationDate(Volunteering other) {
    return creation.compareTo(other.creation);
  }
}

@freezed
class News with _$News implements Comparable {
  const factory News({
    required String image,
    required String overline,
    required String title,
    required String subtitle,
    required String body,
    @TimestampConverter() required Timestamp creation,
  }) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);

  const News._();

  @override
  int compareTo(other) {
    if (other is News) {
      return other.creation.compareTo(creation);
    } else {
      throw ArgumentError('Se esperaba un objeto de tipo News');
    }
  }
}

@freezed
class Application with _$Application {
  const factory Application(
      {required String volunteering, required bool approved}) = _Application;

  factory Application.fromJson(Map<String, Object?> json) =>
      _$ApplicationFromJson(json);
}

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String uid,
    required String name,
    required String surname,
    @Default(false) bool completed,
    String? email,
    String? image,
    String? birthday,
    Gender? gender,
    String? phone,
    @Default([]) List<String> favorites,
    @Default(null) Application? application,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  String fullName() {
    return "$name $surname";
  }

  bool hasVolunteering() {
    return application != null;
  }

  bool isAproved() {
    if (!hasVolunteering()) throw Exception("User with no volunteering.");
    return application!.approved;
  }

  String getAppliedVolunteeringId() {
    return application!.volunteering;
  }
}

@JsonEnum()
enum Gender {
  male("Hombre"),
  female("Mujer"),
  nonBinary("No binario");

  final String text;

  const Gender(this.text);

  static Gender? fromString(String? value) {
    return Gender.values.firstWhere(
      (element) => element.name == value,
      orElse: () => Gender.male,
    );
  }
}

@freezed
class UserUpdate with _$UserUpdate {
  const factory UserUpdate({
    @Default(true) bool completed,
    String? email,
    String? image,
    String? birthday,
    Gender? gender,
    String? phone,
  }) = _UserUpdate;

  factory UserUpdate.fromJson(Map<String, Object?> json) =>
      _$UserUpdateFromJson(json);
}
