import 'package:ser_manos/data/profile_data.dart';
import 'package:ser_manos/models/models.dart';

class ProfileService {
  final ProfileData profileData;

  ProfileService({required this.profileData});

  Future<Profile> getProfile(String uid) {
    return profileData.getProfile(uid);
  }
}
