import 'package:dio/dio.dart';

class SignUpException {
  SignUpException(this.messageSender);
  final void Function(String message) messageSender;

  bool test(Response response) {
    if (response.statusCode! / 100 == 4 || response.statusCode! / 100 == 5 ||
        response.data == null || response.data == "null") {
      // server error
      return false;
    }

    final String message = response.data!["message"];
    if (message == "EMAIL_DUPLICATED") {
      // 존재하지 않는 계정
      messageSender("이미 사용중인 이메일입니다.  다른 이메일을 사용해주세요.");
      return false;
    }
    if (message == "NAME_DUPLICATED") {
      // 올바르지 않은 비밀번호
      messageSender("이미 사용중인 닉네임입니다.  다른 닉네임을 사용해주세요.");
      return false;
    }

    // SUCCESS
    return true;
  }
}