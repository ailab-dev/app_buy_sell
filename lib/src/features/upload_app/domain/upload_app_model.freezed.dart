// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_app_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadAppModel {
  int get currentPage => throw _privateConstructorUsedError;
  bool get nextPage => throw _privateConstructorUsedError;
  bool get backPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadAppModelCopyWith<UploadAppModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadAppModelCopyWith<$Res> {
  factory $UploadAppModelCopyWith(
          UploadAppModel value, $Res Function(UploadAppModel) then) =
      _$UploadAppModelCopyWithImpl<$Res, UploadAppModel>;
  @useResult
  $Res call({int currentPage, bool nextPage, bool backPage});
}

/// @nodoc
class _$UploadAppModelCopyWithImpl<$Res, $Val extends UploadAppModel>
    implements $UploadAppModelCopyWith<$Res> {
  _$UploadAppModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? nextPage = null,
    Object? backPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      backPage: null == backPage
          ? _value.backPage
          : backPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadAppModelImplCopyWith<$Res>
    implements $UploadAppModelCopyWith<$Res> {
  factory _$$UploadAppModelImplCopyWith(_$UploadAppModelImpl value,
          $Res Function(_$UploadAppModelImpl) then) =
      __$$UploadAppModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, bool nextPage, bool backPage});
}

/// @nodoc
class __$$UploadAppModelImplCopyWithImpl<$Res>
    extends _$UploadAppModelCopyWithImpl<$Res, _$UploadAppModelImpl>
    implements _$$UploadAppModelImplCopyWith<$Res> {
  __$$UploadAppModelImplCopyWithImpl(
      _$UploadAppModelImpl _value, $Res Function(_$UploadAppModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? nextPage = null,
    Object? backPage = null,
  }) {
    return _then(_$UploadAppModelImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      backPage: null == backPage
          ? _value.backPage
          : backPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UploadAppModelImpl extends _UploadAppModel {
  _$UploadAppModelImpl(
      {required this.currentPage,
      required this.nextPage,
      required this.backPage})
      : super._();

  @override
  final int currentPage;
  @override
  final bool nextPage;
  @override
  final bool backPage;

  @override
  String toString() {
    return 'UploadAppModel(currentPage: $currentPage, nextPage: $nextPage, backPage: $backPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAppModelImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.backPage, backPage) ||
                other.backPage == backPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage, nextPage, backPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAppModelImplCopyWith<_$UploadAppModelImpl> get copyWith =>
      __$$UploadAppModelImplCopyWithImpl<_$UploadAppModelImpl>(
          this, _$identity);
}

abstract class _UploadAppModel extends UploadAppModel {
  factory _UploadAppModel(
      {required final int currentPage,
      required final bool nextPage,
      required final bool backPage}) = _$UploadAppModelImpl;
  _UploadAppModel._() : super._();

  @override
  int get currentPage;
  @override
  bool get nextPage;
  @override
  bool get backPage;
  @override
  @JsonKey(ignore: true)
  _$$UploadAppModelImplCopyWith<_$UploadAppModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
