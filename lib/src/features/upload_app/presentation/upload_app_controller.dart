import 'dart:io';

import 'package:app_buy_sell/src/features/home/app_list_provider.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/presentation/product_controller.dart';
import 'package:app_buy_sell/src/features/upload_app/domain/upload_app_model.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_app_controller.g.dart';

@riverpod
class UploadAppController extends _$UploadAppController {
  final ImagePicker _imagePicker = ImagePicker();

  AppModel? _currentApp;

  @override
  UploadAppModel build(AppModel? appModel) {
    _currentApp = appModel;
    if (appModel == null) {
      final model = UploadAppModel(
        currentPage: 0,
        nextPage: false,
        backPage: false,
        screenshots: [],
        avatarPath: '',
        appName: '',
        description: '',
        price: '',
        appStoreUrl: '',
        gPlayUrl: '',
        storeValidate: false,
        appInfoValidate: false,
        appImageValidate: false,
        appPriceValidate: false,
        appCatchphrase: '',
        nameLength: 0,
        catchphraseLength: 0,
        descriptionLength: 0,
        didUpload: false,
        isUploading: false,
      );
      return model;
    } else {
      final infoValidate = _validateAppInfo(appModel.name, appModel.catchphrase,
          appModel.description, appModel.categoryType);
      final imagesValidate =
          _validateAppImage(appModel.iconUrl, appModel.banner);
      final priceValidate = _validatePrice(appModel.price);

      final model = UploadAppModel(
        currentPage: 0,
        nextPage: false,
        backPage: false,
        screenshots: appModel.banner,
        avatarPath: appModel.iconUrl,
        appName: appModel.name,
        description: appModel.description,
        price: appModel.price,
        appStoreUrl: appModel.appStoreUrl ?? '',
        gPlayUrl: appModel.gPlayUrl ?? '',
        storeValidate: false,
        appInfoValidate: infoValidate,
        appImageValidate: imagesValidate,
        appPriceValidate: priceValidate,
        appCatchphrase: appModel.catchphrase,
        nameLength: appModel.name.length,
        catchphraseLength: appModel.catchphrase.length,
        descriptionLength: appModel.description.length,
        didUpload: false,
        isUploading: false,
        categoryType: appModel.categoryType,
      );
      return model;
    }
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
    if (Utils.isUrl(url)) {
      state = state.copyWith(appStoreUrl: url, storeValidate: true);
    } else {
      state = state.copyWith(appStoreUrl: url, storeValidate: false);
    }
  }

  void setAppName(String value) {
    state = state.copyWith(appName: value, nameLength: value.length);
    state = state.copyWith(
        appInfoValidate: _validateAppInfo(state.appName, state.appCatchphrase,
            state.description, state.categoryType));
  }

  void setAppCatchphrase(String value) {
    state =
        state.copyWith(appCatchphrase: value, catchphraseLength: value.length);
    state = state.copyWith(
        appInfoValidate: _validateAppInfo(state.appName, state.appCatchphrase,
            state.description, state.categoryType));
  }

  void setAppDescription(String value) {
    state = state.copyWith(description: value, descriptionLength: value.length);
    state = state.copyWith(
        appInfoValidate: _validateAppInfo(state.appName, state.appCatchphrase,
            state.description, state.categoryType));
  }

  void setAppCategory(CategoryType value) {
    state = state.copyWith(categoryType: value);
    state = state.copyWith(
        appInfoValidate: _validateAppInfo(state.appName, state.appCatchphrase,
            state.description, state.categoryType));
  }

  bool _validateAppInfo(String appName, String appCatchphrase,
      String description, CategoryType? categoryType) {
    if (appName.trim().isNotEmpty &&
        appCatchphrase.trim().isNotEmpty &&
        description.trim().isNotEmpty &&
        categoryType != null) {
      return true;
    } else {
      return false;
    }
  }

  void setAppPrice(String value) {
    state = state.copyWith(price: value);
    state = state.copyWith(appPriceValidate: _validatePrice(state.price));
  }

  bool _validatePrice(String price) {
    try {
      final priceValue = int.parse(price.replaceAll(',', ''));
      if (priceValue > 0) {
        return true;
      }
    } catch (_) {}
    return false;
  }

  void setAvatar() async {
    final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      state = state.copyWith(avatarPath: xFile.path);
      state = state.copyWith(
          appImageValidate:
              _validateAppImage(state.avatarPath, state.screenshots));
    }
  }

  void addScreenShots() async {
    List<String> screenshots = List.from(state.screenshots).cast();
    final files = await _imagePicker.pickMultiImage();
    for (final e in files) {
      screenshots.add(e.path);
    }
    state = state.copyWith(screenshots: screenshots);
    state = state.copyWith(
        appImageValidate:
            _validateAppImage(state.avatarPath, state.screenshots));
  }

  void removeScreenshot(int index) {
    List<String> screenshots = List.from(state.screenshots).cast();
    screenshots.removeAt(index);
    state = state.copyWith(screenshots: screenshots);
    state = state.copyWith(
        appImageValidate:
            _validateAppImage(state.avatarPath, state.screenshots));
  }

  bool _validateAppImage(String avatarPath, List<String> screenshots) {
    if (avatarPath.isNotEmpty && screenshots.length >= 3) {
      return true;
    } else {
      return false;
    }
  }

  CollectionReference<AppModel> get _appRef {
    return FirebaseFirestore.instance.collection('apps').withConverter(
          fromFirestore: (snapshot, _) => AppModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<void> uploadApp() async {
    state = state.copyWith(isUploading: true);
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (_currentApp != null) {
      final doc = _appRef.doc(_currentApp?.id);
      List<String> imageUrl = [];
      final storageRef = FirebaseStorage.instance.ref();
      await Future.forEach(state.screenshots, (imagePath) async {
        if (Utils.isUrl(imagePath)) {
          imageUrl.add(imagePath);
        } else {
          final imageRef =
              storageRef.child(uid).child(doc.id).child(Utils.random());
          await imageRef.putFile(
            File(imagePath),
            SettableMetadata(
              contentType: "image/jpeg",
            ),
          );
          final downloadUrl = await imageRef.getDownloadURL();
          imageUrl.add(downloadUrl);
        }
      });
      var avatarUrl = _currentApp?.iconUrl;
      if (!Utils.isUrl(state.avatarPath)) {
        final avatarRef =
            storageRef.child(uid).child(doc.id).child(Utils.random());
        await avatarRef.putFile(
          File(state.avatarPath),
          SettableMetadata(
            contentType: "image/jpeg",
          ),
        );
        avatarUrl = await avatarRef.getDownloadURL();
      }

      final appModel = AppModel(
        name: state.appName,
        description: state.description,
        iconUrl: avatarUrl ?? '',
        price: state.priceValue,
        id: doc.id,
        banner: imageUrl,
        createdAt: _currentApp!.createdAt,
        ownerId: uid,
        appStoreUrl: state.appStoreUrl,
        catchphrase: state.appCatchphrase,
        categoryType: state.categoryType,
        editedAt: DateTime.now(),
      );
      await doc.set(appModel);
      ref
          .read(productControllerProvider(appModel.id).notifier)
          .loadApp(appModel.id);
      ref.read(appListProvider.notifier).getApps();
      state = state.copyWith(didUpload: true);
    } else {
      final doc = _appRef.doc();
      List<String> imageUrl = [];
      final storageRef = FirebaseStorage.instance.ref();
      await Future.forEach(state.screenshots, (imagePath) async {
        final imageRef =
            storageRef.child(uid).child(doc.id).child(Utils.random());
        await imageRef.putFile(
          File(imagePath),
          SettableMetadata(
            contentType: "image/jpeg",
          ),
        );
        final downloadUrl = await imageRef.getDownloadURL();
        imageUrl.add(downloadUrl);
      });
      final avatarRef =
          storageRef.child(uid).child(doc.id).child(Utils.random());
      await avatarRef.putFile(
        File(state.avatarPath),
        SettableMetadata(
          contentType: "image/jpeg",
        ),
      );
      final avatarUrl = await avatarRef.getDownloadURL();
      final appModel = AppModel(
        name: state.appName,
        description: state.description,
        iconUrl: avatarUrl,
        price: state.priceValue,
        id: doc.id,
        banner: imageUrl,
        createdAt: DateTime.now(),
        ownerId: uid,
        appStoreUrl: state.appStoreUrl,
        catchphrase: state.appCatchphrase,
        categoryType: state.categoryType,
      );
      await doc.set(appModel);
      state = state.copyWith(didUpload: true);
    }
  }
}
