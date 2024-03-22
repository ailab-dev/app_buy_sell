import 'package:app_buy_sell/src/features/upload_app/domain/upload_app_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_app_controller.g.dart';

@riverpod
class UploadAppController extends _$UploadAppController {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  UploadAppModel build() {
    final model = UploadAppModel(
      currentPage: 0,
      nextPage: false,
      backPage: false,
      screenshots: [],
      avatartPath: '',
      appName: '',
      description: '',
      category: '',
      price: '',
      appStoreUrl: '',
      gPlayUrl: '',
      storeValidate: false,
      appInfoValidate: false,
      appImageValidate: true,
      appPriceValidate: false,
      appCatchphrase: '',
      nameLength: 0,
      catchphraseLength: 0,
      descriptionLength: 0,
    );
    return model;
  }

  void setCurrentPage(int index) {
    state = state.copyWith(currentPage: index);
  }

  void nextPage() {
    state = state.copyWith(nextPage: true);
    state = state.copyWith(nextPage: false);
  }

  void backPage() {
    state = state.copyWith(backPage: true);
    state = state.copyWith(backPage: false);
  }

  void setAppstoreUrl(String url) {
    if (url.trim().isEmpty) {
      state = state.copyWith(appStoreUrl: url, storeValidate: false);
    } else {
      state = state.copyWith(appStoreUrl: url, storeValidate: true);
    }
  }

  void setAppName(String value) {
    state = state.copyWith(appName: value, nameLength: value.length);
    _validateAppInfo();
  }

  void setAppCatchphrase(String value) {
    state =
        state.copyWith(appCatchphrase: value, catchphraseLength: value.length);
    _validateAppInfo();
  }

  void setAppDescription(String value) {
    state = state.copyWith(description: value, descriptionLength: value.length);
    _validateAppInfo();
  }

  void setAppCategory(String value) {
    state = state.copyWith(category: value);
    _validateAppInfo();
  }

  void _validateAppInfo() {
    if (state.appName.trim().isNotEmpty &&
        state.appCatchphrase.trim().isNotEmpty &&
        state.description.trim().isNotEmpty) {
      state = state.copyWith(appInfoValidate: true);
    } else {
      state = state.copyWith(appInfoValidate: false);
    }
  }

  void setAppPrice(String value) {
    final price = value.replaceAll(',', '');
    state = state.copyWith(price: price);

    try {
      final priceValue = int.parse(price);
      if (priceValue > 0) {
        state = state.copyWith(appPriceValidate: true);
      } else {
        state = state.copyWith(appPriceValidate: false);
      }
    } catch (_) {
      state = state.copyWith(appPriceValidate: false);
    }
  }

  void setAvatar() async {
    final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      state = state.copyWith(avatartPath: xFile.path);
      _validateAppImage();
    }
  }

  void addScreenShots() async {
    List<String> screenshots = List.from(state.screenshots).cast();
    final files = await _imagePicker.pickMultiImage();
    for (final e in files) {
      screenshots.add(e.path);
    }
    state = state.copyWith(screenshots: screenshots);
    _validateAppImage();
  }

  void removeScreenshot(int index) {
    List<String> screenshots = List.from(state.screenshots).cast();
    screenshots.removeAt(index);
    state = state.copyWith(screenshots: screenshots);
    _validateAppImage();
  }

  void _validateAppImage() {
    if (state.avatartPath.isNotEmpty && state.screenshots.length >= 3) {
      state = state.copyWith(appImageValidate: true);
    } else {
      state = state.copyWith(appImageValidate: false);
    }
  }
}
