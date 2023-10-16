import 'package:dio/dio.dart';

class LoginException {
  LoginException(this.messageSender);
  final void Function(String message) messageSender;

  bool test(Response response) {
    if (response.statusCode! / 100 == 4 || response.statusCode! / 100 == 5 ||
        response.data == null || response.data == "null") {
      // server error
      return false;
    }

    final String message = response.data!["message"];
    if (message == "EMAIL_MISMATCH") {
      // 존재하지 않는 계정
      messageSender("존재하지 않는 계정입니다.");
      return false;
    }
    if (message == "PASSWORD_MISMATCH") {
      // 올바르지 않은 비밀번호
      messageSender("올바르지 않은 비밀번호입니다.");
      return false;
    }
    return true;
  }
}