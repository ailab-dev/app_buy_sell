import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_acc_provider.g.dart';

@riverpod
class RegisterAccount extends _$RegisterAccount {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = const AsyncValue.data(true);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
