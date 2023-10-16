import 'member.dart';

class LoginSession {
  LoginSession({
    required this.member,
    required this.isLogin,
  });

  final bool isLogin;
  final Member? member;

}
