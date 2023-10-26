import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';

part 'generated/user_controller.g.dart';

@riverpod
class UserController extends _$UserController{

  @override
  FutureOr<void> build(){}

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