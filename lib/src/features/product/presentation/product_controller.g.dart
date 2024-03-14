// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productControllerHash() => r'a9da4ea270bd350afecd803953fb92001b3c83f5';

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
    extends BuildlessAutoDisposeAsyncNotifier<AppModel> {
  late final AppModel appModel;

  FutureOr<AppModel> build(
    AppModel appModel,
  );
}

/// See also [ProductController].
@ProviderFor(ProductController)
const productControllerProvider = ProductControllerFamily();

/// See also [ProductController].
class ProductControllerFamily extends Family<AsyncValue<AppModel>> {
  /// See also [ProductController].
  const ProductControllerFamily();

  /// See also [ProductController].
  ProductControllerProvider call(
    AppModel appModel,
  ) {
    return ProductControllerProvider(
      appModel,
    );
  }

  @override
  ProductControllerProvider getProviderOverride(
    covariant ProductControllerProvider provider,
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
  String? get name => r'productControllerProvider';
}

/// See also [ProductController].
class ProductControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductController, AppModel> {
  /// See also [ProductController].
  ProductControllerProvider(
    AppModel appModel,
  ) : this._internal(
          () => ProductController()..appModel = appModel,
          from: productControllerProvider,
          name: r'productControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productControllerHash,
          dependencies: ProductControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductControllerFamily._allTransitiveDependencies,
          appModel: appModel,
        );

  ProductControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appModel,
  }) : super.internal();

  final AppModel appModel;

  @override
  FutureOr<AppModel> runNotifierBuild(
    covariant ProductController notifier,
  ) {
    return notifier.build(
      appModel,
    );
  }

  @override
  Override overrideWith(ProductController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProductController, AppModel>
      createElement() {
    return _ProductControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductControllerProvider && other.appModel == appModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductControllerRef on AutoDisposeAsyncNotifierProviderRef<AppModel> {
  /// The parameter `appModel` of this provider.
  AppModel get appModel;
}

class _ProductControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductController, AppModel>
    with ProductControllerRef {
  _ProductControllerProviderElement(super.provider);

  @override
  AppModel get appModel => (origin as ProductControllerProvider).appModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
