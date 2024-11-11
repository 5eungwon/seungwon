
import 'dart:convert';
import 'package:making_the_planting_culture/detail_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:making_the_planting_culture/posting.dart';
import 'package:making_the_planting_culture/signin.dart';
import 'package:making_the_planting_culture/homescreen.dart';
import 'package:making_the_planting_culture/mypage.dart';
import 'package:http/http.dart' as http;
import 'object_Info.dart';
class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  var url = Uri.parse("http://$baseUrl/api/signin");
  bool _isObscured = true;

  Future SendInfo() async{
    final res = await http.post(url,headers:{'Content-Type': 'application/json'},
        body :jsonEncode({'id' : _textEditingController1.text , 'password' : _textEditingController2.text}));
    Map<String,dynamic> Check_login = jsonDecode(res.body);
    if (Check_login["ok"] == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('로그인 실패'),
        ),
      );
    }
    else if (Check_login["ok"] == true) {
      object_info myself = object_info(
          Img: Check_login["data"]["image"],
          Nickname: Check_login["data"]["nickname"],
          Id: Check_login["data"]["id"],
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homescreen(myself: myself,)));
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
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset('assets/AppTtle.png'),
                      height: MediaQuery.of(context).size.height * 0.18),
                  Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Container(
                          width: 250,
                          height: MediaQuery.of(context).size.height * 0.3,
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
                                              0.071,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Material(
                                        child: TextField(
                                          controller: _textEditingController1,
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
                                              0.071,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Material(
                                        child: TextField(
                                          obscureText: _isObscured,
                                          controller: _textEditingController2,
                                          decoration: InputDecoration(
                                            hintText: '비밀번호를 입력하세요',
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
                                      MediaQuery.of(context).size.height * 0.05,
                                  alignment: Alignment.center,
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  SendInfo();
                                                },
                                                child: Text("로그인"),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Signin()),
                                                  );
                                                },
                                                child: Text("회원가입"),
                                              )),
                                        ],
                                      )))
                            ],
                          )))
                ],
              ),
            ))));
  }
}
