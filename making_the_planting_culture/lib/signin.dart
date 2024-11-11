
import 'dart:convert';
import 'object_Info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {



  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _textEditingController3 = TextEditingController();
  TextEditingController _textEditingController4 = TextEditingController();
  var url = Uri.parse("http://$baseUrl/api/signup");
  bool _isObscured = true;

  void SendInfo_Signin() async {
    final res = await http.post(
        url, headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': _textEditingController1.text,
          'nickname': _textEditingController2.text,
          'id': _textEditingController3.text,
          'password': _textEditingController4.text}));
    Map<String, dynamic> k = jsonDecode(res.body);
    if (k["ok"] == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('아이디가 중복되었습니다.'),
        ),
      );
    }
    else if (k["ok"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('회원가입 성공!'),
        ),
      );
      Navigator.pop(context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
            color: Colors.white,
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.lightGreen),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset('assets/AppTtle.png'),
                      height: MediaQuery.of(context).size.height * 0.1),
                  Center(
                      child: Container(
                          width: 250,
                          height: MediaQuery.of(context).size.height * 0.503,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.3, color: Colors.lightGreen),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 200,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Material(
                                        child: TextField(
                                          controller: _textEditingController1,
                                          decoration: InputDecoration(
                                              hintText: "이름을 입력하세요"),
                                        ),
                                      ))),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 200,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Material(
                                        child: TextField(
                                          controller: _textEditingController2,
                                          decoration: InputDecoration(
                                              hintText: "닉네임을 입력하세요"),
                                        ),
                                      ))),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 200,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Material(
                                        child: TextField(
                                          controller: _textEditingController3,
                                          decoration: InputDecoration(
                                              hintText: "아이디를 입력하세요"),
                                        ),
                                      ))),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 200,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Material(
                                        child: TextField(
                                          obscureText: _isObscured,
                                          controller: _textEditingController4,
                                          decoration: InputDecoration(
                                            labelText: '비밀번호를 입력하세요',
                                            suffixIcon: IconButton(
                                              icon: Icon(_isObscured
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscured =
                                                      !_isObscured; // 토글 버튼 클릭 시 상태 변경
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ))),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  alignment: Alignment.center,
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              SendInfo_Signin();
                                            },
                                            child: Text("가입 완료"),
                                          ))))
                            ],
                          )))
                ],
              ),
            ))));
  }
}
