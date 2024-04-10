import 'package:app_buy_sell/src/features/register_profile/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_provider.g.dart';

@riverpod
class EditProfile extends _$EditProfile {
  @override
  FutureOr<UserModel?> build() async {
    return await getMyInfo();
  }

  final _twitterHost = 'twitter.com';
  final _facebookHost = 'facebook.com';
  final _githubHost = 'github.com';

  Future<UserModel?> getMyInfo() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final ref = await rootRef.doc(uid).get();
    var userModel = ref.data();
    final xValid = _validateSnsUrl(userModel?.twitter ?? '', _twitterHost);
    final githubValid = _validateSnsUrl(userModel?.facebook ?? '', _githubHost);
    final facebookValid =
        _validateSnsUrl(userModel?.facebook ?? '', _facebookHost);
    final portfolioValid = _validateSnsUrl(userModel?.portfolio ?? '', '');
    userModel = userModel?.copyWith(
      xValid: xValid,
      facebookValid: facebookValid,
      githubValid: githubValid,
      portfolioValid: portfolioValid,
    );
    return userModel;
  }

  CollectionReference<UserModel> get rootRef {
    return FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<void> editProfile() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    var userData = state.value;
    if (uid != null && userData != null) {
      await rootRef.doc(uid).set(userData);
    }
  }

  void setUserName(String value) {
    state = AsyncValue.data(state.value?.copyWith(userName: value));
  }

  void setCountry(String value) {
    state = AsyncValue.data(state.value?.copyWith(country: value));
  }

  void setDescription(String value) {
    state = AsyncValue.data(state.value?.copyWith(description: value));
  }

  void setTwitter(String value) {
    if (_validateSnsUrl(value, _twitterHost)) {
      state =
          AsyncValue.data(state.value?.copyWith(xValid: true, twitter: value));
    } else {
      state =
          AsyncValue.data(state.value?.copyWith(xValid: false, twitter: value));
    }
  }

  bool _validateSnsUrl(String value, String host) {
    try {
      if (value.trim().isNotEmpty) {
        final uri = Uri.parse(value);
        if (host.isEmpty) {
          return uri.isAbsolute && uri.host.isNotEmpty;
        } else {
          if (uri.host.toLowerCase() != host ||
              uri.pathSegments.length != 1 ||
              uri.scheme != 'https') {
            return false;
          }
        }
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  void setFacebook(String value) {
    if (_validateSnsUrl(value, _facebookHost)) {
      state = AsyncValue.data(
          state.value?.copyWith(facebook: value, facebookValid: true));
    } else {
      state = AsyncValue.data(
          state.value?.copyWith(facebook: value, facebookValid: false));
    }
  }

  void setGithub(String value) {
    if (_validateSnsUrl(value, _githubHost)) {
      state = AsyncValue.data(
          state.value?.copyWith(github: value, githubValid: true));
    } else {
      state = AsyncValue.data(
          state.value?.copyWith(github: value, githubValid: false));
    }
  }

  void setPortfolio(String value) {
    if (_validateSnsUrl(value, '')) {
      state = AsyncValue.data(
          state.value?.copyWith(portfolio: value, portfolioValid: true));
    } else {
      state = AsyncValue.data(
          state.value?.copyWith(portfolio: value, portfolioValid: false));
    }
  }
}
