import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuk_pro_app/models/login_session.dart';

class LoginSessionNotifier extends StateNotifier<LoginSession> {
  LoginSessionNotifier()
      : super(LoginSession(
          member: null,
          isLogin: false,
        ));

  void loginSuccess() {
    state = LoginSession(member: null, isLogin: true);
  }

  void logout() {
    state = LoginSession(member: null, isLogin: false);
  }
}

final loginSessionProvider =
    StateNotifierProvider<LoginSessionNotifier, LoginSession>(
        (ref) => LoginSessionNotifier());
