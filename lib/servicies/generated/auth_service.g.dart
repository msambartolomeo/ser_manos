// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggedInUserHash() => r'c8e2c92ce544dcadbf4d4c41898dbef487dd57a6';

/// See also [loggedInUser].
@ProviderFor(loggedInUser)
final loggedInUserProvider = AutoDisposeProvider<User?>.internal(
  loggedInUser,
  name: r'loggedInUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggedInUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggedInUserRef = AutoDisposeProviderRef<User?>;
String _$authServiceHash() => r'e330a32944b13c8e89221a112433b4394a75fd1e';

/// See also [AuthService].
@ProviderFor(AuthService)
final authServiceProvider =
    AutoDisposeAsyncNotifierProvider<AuthService, void>.internal(
  AuthService.new,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthService = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
