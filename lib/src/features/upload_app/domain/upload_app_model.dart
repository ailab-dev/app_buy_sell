import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'upload_app_model.freezed.dart';

@freezed
class UploadAppModel with _$UploadAppModel {
  UploadAppModel._();
  factory UploadAppModel({
    required int currentPage,
    required bool nextPage,
    required bool backPage,
    required List<String> screenshots,
    required String avatarPath,
    required String appName,
    required String description,
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
    CategoryType? categoryType,
  }) = _UploadAppModel;

  double get getProgress {
    return currentPage / 3;
  }

  String get priceValue {
    return price.replaceAll(',', '');
  }

  String get priceFormat {
    try {
      final formatter = NumberFormat.decimalPatternDigits(
        locale: 'ja_JP',
      );
      return formatter.format(int.parse(priceValue));
    } catch (_) {
      return '';
    }
  }
}
