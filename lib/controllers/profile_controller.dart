import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController{

  @override
  FutureOr<Profile> build() async {

    final User? user = ref.read(currentUserProvider);

    if(user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(profileServiceProvider);

    return await service.getProfile(user.uid);
  }

  FutureOr<void> create(Profile profile){

  }

  FutureOr<void> updateProfile(Profile profile){
    
  }

  FutureOr<void> updateVolunteering(String volunteeringId){
    
  }

  FutureOr<void> addFavorite(String volunteeringId){
    
  }

  FutureOr<void> removeFavorite(String volunteeringId){
    
  }

}