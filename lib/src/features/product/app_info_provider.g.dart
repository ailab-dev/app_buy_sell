// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appInfoHash() => r'fa02757e10a4c2a96dcab4336434b53fb1d963e0';

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

abstract class _$AppInfo
    extends BuildlessAutoDisposeAsyncNotifier<ProductInfoModel?> {
  late final String? appId;

  FutureOr<ProductInfoModel?> build(
    String? appId,
  );
}

/// See also [AppInfo].
@ProviderFor(AppInfo)
const appInfoProvider = AppInfoFamily();

/// See also [AppInfo].
class AppInfoFamily extends Family<AsyncValue<ProductInfoModel?>> {
  /// See also [AppInfo].
  const AppInfoFamily();

  /// See also [AppInfo].
  AppInfoProvider call(
    String? appId,
  ) {
    return AppInfoProvider(
      appId,
    );
  }

  @override
  AppInfoProvider getProviderOverride(
    covariant AppInfoProvider provider,
  ) {
    return call(
      provider.appId,
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
  String? get name => r'appInfoProvider';
}

/// See also [AppInfo].
class AppInfoProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AppInfo, ProductInfoModel?> {
  /// See also [AppInfo].
  AppInfoProvider(
    String? appId,
  ) : this._internal(
          () => AppInfo()..appId = appId,
          from: appInfoProvider,
          name: r'appInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appInfoHash,
          dependencies: AppInfoFamily._dependencies,
          allTransitiveDependencies: AppInfoFamily._allTransitiveDependencies,
          appId: appId,
        );

  AppInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
  }) : super.internal();

  final String? appId;

  @override
  FutureOr<ProductInfoModel?> runNotifierBuild(
    covariant AppInfo notifier,
  ) {
    return notifier.build(
      appId,
    );
  }

  @override
  Override overrideWith(AppInfo Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppInfoProvider._internal(
        () => create()..appId = appId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appId: appId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AppInfo, ProductInfoModel?>
      createElement() {
    return _AppInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppInfoProvider && other.appId == appId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppInfoRef on AutoDisposeAsyncNotifierProviderRef<ProductInfoModel?> {
  /// The parameter `appId` of this provider.
  String? get appId;
}

class _AppInfoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppInfo, ProductInfoModel?>
    with AppInfoRef {
  _AppInfoProviderElement(super.provider);

  @override
  String? get appId => (origin as AppInfoProvider).appId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
