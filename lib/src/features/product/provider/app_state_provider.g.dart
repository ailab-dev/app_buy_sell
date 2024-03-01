// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appStateHash() => r'88dedbcddf906367f8e1be5e49c485a4acfb33a4';

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

abstract class _$AppState extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final AppModel appModel;

  FutureOr<bool> build(
    AppModel appModel,
  );
}

/// See also [AppState].
@ProviderFor(AppState)
const appStateProvider = AppStateFamily();

/// See also [AppState].
class AppStateFamily extends Family<AsyncValue<bool>> {
  /// See also [AppState].
  const AppStateFamily();

  /// See also [AppState].
  AppStateProvider call(
    AppModel appModel,
  ) {
    return AppStateProvider(
      appModel,
    );
  }

  @override
  AppStateProvider getProviderOverride(
    covariant AppStateProvider provider,
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
  String? get name => r'appStateProvider';
}

/// See also [AppState].
class AppStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AppState, bool> {
  /// See also [AppState].
  AppStateProvider(
    AppModel appModel,
  ) : this._internal(
          () => AppState()..appModel = appModel,
          from: appStateProvider,
          name: r'appStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appStateHash,
          dependencies: AppStateFamily._dependencies,
          allTransitiveDependencies: AppStateFamily._allTransitiveDependencies,
          appModel: appModel,
        );

  AppStateProvider._internal(
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
  FutureOr<bool> runNotifierBuild(
    covariant AppState notifier,
  ) {
    return notifier.build(
      appModel,
    );
  }

  @override
  Override overrideWith(AppState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AppState, bool> createElement() {
    return _AppStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppStateProvider && other.appModel == appModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppStateRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `appModel` of this provider.
  AppModel get appModel;
}

class _AppStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppState, bool>
    with AppStateRef {
  _AppStateProviderElement(super.provider);

  @override
  AppModel get appModel => (origin as AppStateProvider).appModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
