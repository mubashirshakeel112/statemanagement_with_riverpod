import 'package:flutter/material.dart';
import 'package:riverpod_advance/presentation/home/home_view.dart';
import 'package:riverpod_advance/presentation/login/notifier/login_state.dart';
import 'package:riverpod_advance/repository/login_repo.dart';
import 'package:riverpod_advance/utils/helpers/global_keys.dart';
import 'package:riverpod_advance/widgets/custom_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() => LoginState.initialize();

  final LoginRepository _loginRepository = LoginRepository();

  bool get isLoginValid => state.username.isNotEmpty && state.password.isNotEmpty;

  setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  setUsername(String value) {
    state = state.copyWith(username: value);
  }

  setPassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> login() async {
    setLoading(true);
    try {
      final result = await _loginRepository.login(state.username, state.password);
      if (result) {
        debugPrint('Success');
        navigatorKey.currentState?.pushReplacementNamed(HomeView.id);
        showAppSnackBar('Login Successfully', 'Success');
      } else {
        debugPrint('Fail');
        showAppSnackBar('Login Failed', 'Error', isError: true);
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
