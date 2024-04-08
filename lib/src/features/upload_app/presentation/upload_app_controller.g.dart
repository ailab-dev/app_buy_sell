// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_app_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uploadAppControllerHash() =>
    r'077c51357821020ce7009ab7795d54d844ca2cd1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UploadAppController
    extends BuildlessAutoDisposeNotifier<UploadAppModel> {
  late final AppModel? appModel;

  UploadAppModel build(
    AppModel? appModel,
  );
}

/// See also [UploadAppController].
@ProviderFor(UploadAppController)
const uploadAppControllerProvider = UploadAppControllerFamily();

/// See also [UploadAppController].
class UploadAppControllerFamily extends Family<UploadAppModel> {
  /// See also [UploadAppController].
  const UploadAppControllerFamily();

  /// See also [UploadAppController].
  UploadAppControllerProvider call(
    AppModel? appModel,
  ) {
    return UploadAppControllerProvider(
      appModel,
    );
  }

  @override
  UploadAppControllerProvider getProviderOverride(
    covariant UploadAppControllerProvider provider,
  ) {
    return call(
      provider.appModel,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'uploadAppControllerProvider';
}

/// See also [UploadAppController].
class UploadAppControllerProvider extends AutoDisposeNotifierProviderImpl<
    UploadAppController, UploadAppModel> {
  /// See also [UploadAppController].
  UploadAppControllerProvider(
    AppModel? appModel,
  ) : this._internal(
          () => UploadAppController()..appModel = appModel,
          from: uploadAppControllerProvider,
          name: r'uploadAppControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadAppControllerHash,
          dependencies: UploadAppControllerFamily._dependencies,
          allTransitiveDependencies:
              UploadAppControllerFamily._allTransitiveDependencies,
          appModel: appModel,
        );

  UploadAppControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appModel,
  }) : super.internal();

  final AppModel? appModel;

  @override
  UploadAppModel runNotifierBuild(
    covariant UploadAppController notifier,
  ) {
    return notifier.build(
      appModel,
    );
  }

  @override
  Override overrideWith(UploadAppController Function() create) {
    return ProviderOverride(
      origin: this,
      override: UploadAppControllerProvider._internal(
        () => create()..appModel = appModel,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appModel: appModel,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UploadAppController, UploadAppModel>
      createElement() {
    return _UploadAppControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadAppControllerProvider && other.appModel == appModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadAppControllerRef on AutoDisposeNotifierProviderRef<UploadAppModel> {
  /// The parameter `appModel` of this provider.
  AppModel? get appModel;
}

class _UploadAppControllerProviderElement
    extends AutoDisposeNotifierProviderElement<UploadAppController,
        UploadAppModel> with UploadAppControllerRef {
  _UploadAppControllerProviderElement(super.provider);

  @override
  AppModel? get appModel => (origin as UploadAppControllerProvider).appModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
