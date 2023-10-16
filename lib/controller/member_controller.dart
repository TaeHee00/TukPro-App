import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../exception/login_exception.dart';
import '../exception/sign_up_exception.dart';
import '../model/member.dart';
import '../provider/login_session_provider.dart';

class MemberController{
  MemberController({
    required this.messageSender,
    required this.ref,
  }) : loginException = LoginException(messageSender), signUpException = SignUpException(messageSender);
  final void Function(String message) messageSender;
  final LoginException loginException;
  final SignUpException signUpException;
  final WidgetRef ref;
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

  Future<bool> _signUpValid(String email, String password, String name) async {
    final response = await dio.post("/member/valid", data: json.encode({
      "email": email,
      "password": password,
      "name": name,
    }));
    return signUpException.test(response);
  }

  Future<Member?> login(String email, String password) async {
    // TODO: JSON DATA 변수로 묶어서 Valid, Login 두쪽에서 활용해서 코드 줄이기

    // 유효성 확인 실패
    if (!await _loginValid(email, password)) {
      return null;
    }

    // 유효성 확인 성공 -> 로그인 진행
    final response = await dio.post("/member/login",
        data: json.encode({
          "email": email,
          "password": password,
        }));
    ref.read(loginSessionProvider.notifier).loginSuccess();
    return Member.fromJson(response.data);
  }

  Future<Member?> signUp(String email, String password, String username) async {
    // 유효성 확인 실패
    if (!await _signUpValid(email, password, username)) {
      return null;
    }

    // TODO: 유효성 확인 성공 -> 회원가입 진행 (수정 필요)
    final response = await dio.post("/member",
        data: json.encode({
          "email": email,
          "password": password,
          "name": username,
        }));
    return Member.fromJson(response.data);
  }
}
