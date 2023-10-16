import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tuk_pro_app/exception/login_exception.dart';

class Member {
  Member({
    required this.messageSender,
  }) : loginException = LoginException(messageSender);
  // Member.fromJson(Map<String, dynamic> json)
  //     : id = json["id"],
  //       email = json["email"],
  //       name = json["name"];

  int? id;
  String? email;
  String? name;
  final void Function(String message) messageSender;
  final LoginException loginException;
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:8080",
    ),
  );

  Future<bool> loginValid(String email, String password) async {
    final response = await dio.post(
      "/member/login/valid",
      data: json.encode({
          "email": email,
          "password": password,
        }));
    bool testRes = loginException.test(response);
    return true;
    // Exception test 후에 pass 나오면 다음꺼 진행
  }
}