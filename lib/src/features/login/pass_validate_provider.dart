import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pass_validate_provider.g.dart';

@riverpod
class PassValidate extends _$PassValidate {
  final _error = '小文字・大文字・数字を含めた8桁以上。';
  @override
  String? build() {
    return null;
  }

  void validate(String pass) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (!regex.hasMatch(pass)) {
      state = _error;
    } else {
      state = null;
    }
  }
}
