
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_validate_provider.g.dart';

@riverpod
class RegisterValidate extends _$RegisterValidate {
  @override
  bool build() {
    return false;
  }

  void validate(String name) {    
    if (name.trim().isEmpty) {
      state = false;
    } else {
      state = true;
    }
  }
}
