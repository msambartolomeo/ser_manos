import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/models.freezed.dart';
part 'generated/models.g.dart';

@freezed
class Volunteering with _$Volunteering {
  const factory Volunteering(
      {required String image,
      required String name,
      required String purpose,
      required String description,
      required List<String> requirements,
      required List<String> disponibility,
      required int vacants,
      required String address}) = _Volunteering;

  factory Volunteering.fromJson(Map<String, dynamic> json) =>
      _$VolunteeringFromJson(json);

  const Volunteering._();

  bool hasVacancies() {
    return vacants > 0;
  }
}

@freezed
class News with _$News {
  const factory News(
      {required String image,
      required String overline,
      required String title,
      required String subtitle,
      required String body}) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);
}

@freezed
class User with _$User {
  const factory User(
      {required String name,
      required String image,
      required String email,
      required String birthday,
      required String gender,
      required String phone,
      required List<String> favorites,
      required Map? application}) = _User;

  factory User.fromJson(Map<String, Object?> json) =>
      _$UserFromJson(json);

  const User._();

  bool hasVolunteering() {
    return application != null;
  }

  bool isAproved() {
    if (!hasVolunteering()) throw Exception("User with no volunteering.");
    return application!["approved"];
  }

  String getAppliedVolunteeringId() {
    return hasVolunteering() ? application!["volunteering"] : null;
  }
}
