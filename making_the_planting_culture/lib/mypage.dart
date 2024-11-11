import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:making_the_planting_culture/object_Info.dart';

class Mypage extends StatefulWidget {
  // final object_info myself;
  const Mypage({super.key,
    // required this.myself
  });

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(   //앱바
          centerTitle: true,
          title: Text("마이페이지"),
          backgroundColor: Colors.lightGreenAccent,
          elevation: 7,
          shadowColor: Colors.grey,
        ),
        body: Container(  //앱바아래에 컨테이너 전체
            child: Column(  //가로로 정렬
          children: [
            Container(   //사진과 닉네임,티어 보여주는 박스
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(width: 3, color: Colors.grey)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // 그림자 위치 (가로, 세로)
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.25,
                child: Row( // 가로로 정렬
                  children: [
                    Container(  //프로필사진 박스
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2.5),
                                borderRadius: BorderRadius.circular(4)),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ClipRRect(
                                child: Image.asset(
                              'assets/AppTtle.png',
                              fit: BoxFit.cover,
                            )))),
                    Container( //프로필 사진 옆 닉네임과 티어 보여줄 박스
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.grey, width: 3))),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.7,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                              color: Colors.blue,
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                color: Colors.yellow,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.2,
                                  color: Colors.purple,
                                )),
                          ],
                        ))
                  ],
                )),
            Container(//child:
                //GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                )
          ],
        )));
  }
}
