import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_app_model.freezed.dart';

@freezed
class UploadAppModel with _$UploadAppModel {
  UploadAppModel._();
  factory UploadAppModel({
    required int currentPage,
    required bool nextPage,
    required bool backPage,
  }) = _UploadAppModel;

  double get getProgress {
    return currentPage / 3;
  }
}
