import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_app_model.freezed.dart';

@freezed
class UploadAppModel with _$UploadAppModel {
  UploadAppModel._();
  factory UploadAppModel({
    required int currentPage,
    required bool nextPage,
    required bool backPage,
    required List<String> screenshots,
    required String avatartPath,
    required String appName,
    required String description,
    required String category,
    required String price,
    required String appStoreUrl,
    required String gPlayUrl,
    required bool storeValidate,
    required bool appInfoValidate,
    required bool appImageValidate,
    required bool appPriceValidate,
    required String appCatchphrase,
    required int nameLength,
    required int catchphraseLength,
    required int descriptionLength,
    required bool didUpload,
    required bool isUploading,
  }) = _UploadAppModel;

  double get getProgress {
    return currentPage / 3;
  }

  String get priceValue {
    return price.replaceAll(',', '');
  }
}
