import 'dart:convert';

import 'package:dio/dio.dart';

import '../exception/login_exception.dart';
import '../model/member.dart';

class MemberController {
  MemberController({
    required this.messageSender,
  }) : loginException = LoginException(messageSender);
  final void Function(String message) messageSender;
  final LoginException loginException;
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:8080",
    ),
  );

  Future<bool> _loginValid(String email, String password) async {
    final response = await dio.post("/member/login/valid",
        data: json.encode({
          "email": email,
          "password": password,
        }));
    return loginException.test(response);
    // Exception test 후에 true 나오면 다음꺼 진행
  }

  Future<Member?> login(String email, String password) async {
    // 유효성 확인 실패
    if (!await _loginValid(email, password)) {
      return null;
    }

    // 유효성 확인 성공 -> 로그인 진행
    final response = await dio.post(
      "/member/login",
      data: json.encode({
        "email": email,
        "password": password,
      }));
    return Member.fromJson(response.data);
  }
}
