// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangeHash() => r'5e24d479b4ff70d40102cc40cf1a6c3eaa35e458';

/// See also [authStateChange].
@ProviderFor(authStateChange)
final authStateChangeProvider = AutoDisposeStreamProvider<User?>.internal(
  authStateChange,
  name: r'authStateChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangeRef = AutoDisposeStreamProviderRef<User?>;
String _$authDataHash() => r'e23fc300ba990780b55e2882be1903b6a60d6ffd';

/// See also [AuthData].
@ProviderFor(AuthData)
final authDataProvider =
    AutoDisposeAsyncNotifierProvider<AuthData, void>.internal(
  AuthData.new,
  name: r'authDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthData = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
