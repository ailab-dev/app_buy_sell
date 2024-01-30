import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_validate_provider.g.dart';

@riverpod
class EmailValidate extends _$EmailValidate {
  final _error = 'メール アドレスの形式が正しくありません。';
  @override
  String? build() {
    return null;
  }

  void validate(String email) {
    final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegex.hasMatch(email)) {
      state = _error;
    } else {
      state = null;
    }
  }
}
