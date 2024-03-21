import 'package:app_buy_sell/src/features/upload_app/domain/upload_app_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_app_controller.g.dart';

@riverpod
class UploadAppController extends _$UploadAppController {
  @override
  UploadAppModel build() {
    final model =
        UploadAppModel(currentPage: 0, nextPage: false, backPage: false);
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
}
