import 'dart:convert';
import 'object_Info.dart';
import "package:flutter/material.dart";
import 'package:making_the_planting_culture/object_Info.dart';
import 'package:http/http.dart' as http;
import 'package:making_the_planting_culture/detail_all.dart';

class Homescreen extends StatefulWidget {
  final object_info myself;
  Homescreen({super.key,
    required this.myself
  });
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String url = "http://$baseUrl/api/post";
  List<Post_info> posts = [];

  @override
  void initState() {
    super.initState();
    GetAllData();
  }

  Future<void> GetAllData () async{
    final res = await http.get(Uri.parse(url));
    Map<String,dynamic> Alldata = jsonDecode(res.body);
    print(res.body);
    print(Alldata["data"][0]["content"]);
    posts.clear();
    setState(() {
      for(int i=0;i<Alldata["data"].length;i++){
        posts.add(Post_info.fromJson(Alldata["data"][i]));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("포스팅",), backgroundColor: Colors.white,centerTitle: true,),
      drawer: Container(child:
          ListView(children: [
            Container()
          ],)
      ),
      body: RefreshIndicator(
        onRefresh: () async{ await GetAllData();},

        child:Container(child:
         GridView.builder(
        itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 ,crossAxisSpacing: 0.8),
        itemBuilder: (context, index) {
          return EachPost(
              id: posts[index].id ?? "",
              user_id: posts[index].user_id ?? "",
              title: posts[index].title ?? "",
              content: posts[index].content ?? "",
              image: posts[index].image ?? "" );
        },)


      ),

      ),
      bottomNavigationBar:Container(height:50,color: Colors.lightGreen,),
    );
  }

  Widget EachPost({
    required String id,
    required String user_id,
    required String title,
    required String content,
    required String image
  }){
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage_all(
                      title: title, content: content, image: image,user_id:user_id)));
        },
        child: Container(  //포스팅 하나의 박스
            padding: EdgeInsets.all(8),
            color: Colors.white12,
            child: Column(  //세로정렬
              children: [
                Container(  //프로필사진 박스 + 제목 박스
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(  //프로필사진박스
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Row(
                              children: [
                                Container(  //프로필사진
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.16,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width * 0.13,
                                      height:
                                          MediaQuery.of(context).size.height * 0.06,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle),
                                    )),
                                Container(  //닉네임
                                    padding: EdgeInsets.only(left: 5),
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(id)),
                              ],
                            )),
                        Container( //제목 박스
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // 그림자 위치 (가로, 세로)
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    )),
                Container(  //글내용과 사진넣을 박스
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // 그림자 위치 (가로, 세로)
                      ),
                    ],
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
              ],
            )));
  }
}
