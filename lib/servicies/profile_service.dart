import 'package:ser_manos/data/profile_data.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/servicies/volunteering_service.dart';

class ProfileService {
  final ProfileData profileData;
  final VolunteeringService volunteeringService;

  ProfileService(
      {required this.profileData, required this.volunteeringService});

  Future<Profile> getProfile(String uid) async {
    Profile? profile = await profileData.getProfile(uid);

    if (profile == null) {
      throw Exception("Profile does not exist.");
    }

    return profile;
  }

  Future<void> apply(String uid, String volunteeringId) async {
    Profile profile = (await profileData.getProfile(uid))!;

    if (profile.myVolunteering != "") {
      throw Exception("Profile already applied to a volunteering.");
    }
    if (!(await volunteeringService.hasVacancies(volunteeringId))) {
      throw Exception("Applied to volunteerings with no vacants.");
    }

    return profileData.apply(uid, volunteeringId);
  }
}
