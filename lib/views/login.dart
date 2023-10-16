import 'dart:io';

import 'package:flutter/material.dart';

import '../controller/member_controller.dart';
import '../model/member.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final MemberController _memberController = MemberController(messageSender: _snackBarMessage);

  // 로그인 모드 - 기본값 (로그인 상태)
  bool _isLogin = true;
  var _enteredEmail = "";
  var _enteredPassword = "";
  File? _selectedImage;
  var _isAuthenticating = false;
  var _enteredUsername = "";
  Member? _loginMember;

  void _snackBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, softWrap: true,),
      ),
    );
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
        _loginMember = await _memberController.login(_enteredEmail, _enteredPassword);

        // 로그인 실패시 빠져나감
        if (_loginMember == null) {
          return;
        }
      } else {
        // 회원가입 모드
        _loginMember = await _memberController.signUp(_enteredEmail, _enteredPassword, _enteredUsername);

        // 회원가입 실패시 빠져나감
        if (_loginMember == null) {
          return;
        }
        // TODO: 프로필 사진 저장 기능 구현
      }
    } on Exception catch (error) {
      // TODO: 나중에 Exception 상속받아서 따로 관리 해주기
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("System Error"),
              ));
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
                    top: 0,
                    bottom: 50,
                    left: 20,
                    right: 20,
                  ),
                  width: 200,
                  child: Image.asset("assets/images/tino.png"),
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
        ),
    );
  }
}
