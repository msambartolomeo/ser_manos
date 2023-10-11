// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginStateHash() => r'3393f4b47365f70c8462f87290c09655c30f835d';

/// See also [loginState].
@ProviderFor(loginState)
final loginStateProvider = AutoDisposeProvider<LoginState>.internal(
  loginState,
  name: r'loginStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginStateRef = AutoDisposeProviderRef<LoginState>;
String _$authServiceHash() => r'8f1097eef627f17971690a80906c0e5c7775dc13';

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
