// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productControllerHash() => r'e4c2dbada916837dea7a1e2b16ba5c93b132cbfd';

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

abstract class _$ProductController
    extends BuildlessAutoDisposeAsyncNotifier<AppModel?> {
  late final String appId;

  FutureOr<AppModel?> build(
    String appId,
  );
}

/// See also [ProductController].
@ProviderFor(ProductController)
const productControllerProvider = ProductControllerFamily();

/// See also [ProductController].
class ProductControllerFamily extends Family<AsyncValue<AppModel?>> {
  /// See also [ProductController].
  const ProductControllerFamily();

  /// See also [ProductController].
  ProductControllerProvider call(
    String appId,
  ) {
    return ProductControllerProvider(
      appId,
    );
  }

  @override
  ProductControllerProvider getProviderOverride(
    covariant ProductControllerProvider provider,
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
  String? get name => r'productControllerProvider';
}

/// See also [ProductController].
class ProductControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductController, AppModel?> {
  /// See also [ProductController].
  ProductControllerProvider(
    String appId,
  ) : this._internal(
          () => ProductController()..appId = appId,
          from: productControllerProvider,
          name: r'productControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productControllerHash,
          dependencies: ProductControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductControllerFamily._allTransitiveDependencies,
          appId: appId,
        );

  ProductControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
  }) : super.internal();

  final String appId;

  @override
  FutureOr<AppModel?> runNotifierBuild(
    covariant ProductController notifier,
  ) {
    return notifier.build(
      appId,
    );
  }

  @override
  Override overrideWith(ProductController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProductController, AppModel?>
      createElement() {
    return _ProductControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductControllerProvider && other.appId == appId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductControllerRef on AutoDisposeAsyncNotifierProviderRef<AppModel?> {
  /// The parameter `appId` of this provider.
  String get appId;
}

class _ProductControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductController,
        AppModel?> with ProductControllerRef {
  _ProductControllerProviderElement(super.provider);

  @override
  String get appId => (origin as ProductControllerProvider).appId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
