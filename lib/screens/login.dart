import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/member.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // 로그인 모드 - 기본값 (로그인 상태)
  bool _isLogin = true;
  var _enteredEmail = "";
  var _enteredPassword = "";
  File? _selectedImage;
  var _isAuthenticating = false;
  var _enteredUsername = "";
  Member? _loginMember;

  Future<http.Response> serverPostRequest(String endpoint, Object body) async {
    String _endpoint = endpoint;
    Object _body = body;

    var url = Uri.http('localhost:8080', _endpoint);
    final header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.post(
      headers: header,
      url,
      body: json.encode(_body),
    );
    return response;
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      // TODO: 에러 메세지
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        // 로그인 모드
        // TODO: valid api 발급 예정
        // server login validate
        final loginValid = await serverPostRequest(
          "member/login/valid",
          {
            "email": _enteredEmail,
            "password": _enteredPassword,
          },
        );

        http.Response? loginResponse;
        switch (json.decode(loginValid.body)["message"]) {
          case "EMAIL_MISMATCH":
            throw Exception("존재하지 않는 계정입니다.");
          case "PASSWORD_MISMATCH":
            throw Exception("비밀번호가 일치하지 않습니다.");
          case "SUCCESS":
            // server login request
            loginResponse = await serverPostRequest(
              "member/login",
              {
                'email': _enteredEmail,
                'password': _enteredPassword,
              },
            );
        }

        if (loginResponse!.statusCode / 100 == 4) {
          // 로그인 에러
          throw Exception("서버 오류");
        }

        _loginMember = Member.fromJson(json.decode(loginResponse.body));
      } else {
        // 회원가입 모드
        // TODO 로그인서버 response data 수정하여 이메일 중복 등 예외처리 코드도 반환하도록하기
        final response = await serverPostRequest(
          "member",
          {
            'email': _enteredEmail,
            'name': _enteredUsername,
            'password': _enteredPassword,
          },
        );

        if (response.statusCode / 100 == 4) {
          // 로그인 에러
          throw Exception("서버 오류");
        }
        if (response.statusCode / 100 == 5) {
          // 서버 에러
          throw Exception("회원가입 실패");
        }

        _loginMember = Member.fromJson(json.decode(response.body));
        // firebase에 경로를 만들어줌
        // final storageRef = FirebaseStorage.instance
        //     .ref()
        //     .child("user_images")
        //     .child("${userCredentials.user!.uid}.jpg");
        // 그 경로에 이미지 전달
        // await storageRef.putFile(_selectedImage!);
        // final imageUrl = await storageRef.getDownloadURL();
        // print(imageUrl);

        // FirebaseFirestore.instance
        //     .collection("users")
        //     .doc(userCredentials.user!.uid)
        //     .set({
        //   "username": _enteredUsername,
        //   "email": _enteredEmail,
        //   "image_url": imageUrl,
        // });
      }
    } on Exception catch (error) {
      // TODO: 나중에 Exception 상속받아서 따로 관리 해주기
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        _isLogin
            ? SnackBar(
                content: Text(error.toString().split("Exception: ")[1]),
              )
            : SnackBar(
                content: Text("회원가입 실패"),
              ),
      );
    } finally {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  width: 200,
                  // child: Image.asset("assets/images/chat.png"),
                  child: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 200,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // if (_isLogin)
                            // UserImagePicker(onPickImage: (pickedImage) {
                            //   _selectedImage = pickedImage;
                            // }),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "이메일"),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains("@")) {
                                  return "이메일주소가 유효하지 않습니다. 다시 입력해주세요.";
                                }

                                return null;
                              },
                            ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "닉네임",
                                ),
                                enableSuggestions: false,
                                onSaved: (value) {
                                  _enteredUsername = value!;
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.trim().length < 4) {
                                    return "4글자 이상으로 설정해주세요!";
                                  }
                                  return null;
                                },
                              ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "비밀번호"),
                              obscureText: true,
                              onSaved: (value) => _enteredPassword = value!,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.trim().length < 6) {
                                  return _isLogin
                                      ? "비밀번호가 유효하지 않습니다."
                                      : "비밀번호는 6자리 이상의 문자로 구성해주세요";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            if (_isAuthenticating)
                              const CircularProgressIndicator(),
                            if (!_isAuthenticating)
                              ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer),
                                child: Text(_isLogin ? "로그인" : "회원가입"),
                              ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin ? "계정이 없으신가요?" : "계정이 있으신가요? 로그인하세요!",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
