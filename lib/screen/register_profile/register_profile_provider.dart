import 'package:app_buy_sell/service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_profile_provider.g.dart';

@riverpod
class RegisterProfile extends _$RegisterProfile {
  final UserService _userService = UserService();
  
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> register(String name) async {
    state = const AsyncValue.loading();
    try {
      await _userService.createUserProfile(name);
      state = const AsyncValue.data(true);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
