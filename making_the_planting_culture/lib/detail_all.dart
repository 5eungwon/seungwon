import 'package:flutter/material.dart';

class DetailPage_all extends StatefulWidget {
  String user_id;
  String title;
  String content;
  String image;
  DetailPage_all({super.key,
    required this.title,
    required this.content,
    required this.image,
    required this.user_id,
  });

  @override
  State<DetailPage_all> createState() => _DetailPage_allState();
}

class _DetailPage_allState extends State<DetailPage_all> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user_id),centerTitle: true,),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Flexible(child: Profile_box(),flex:4),
                  Flexible(child: Title_box(),flex:2),
                  Flexible(child: Image_box(),flex:17),
                  Flexible(child: Contents_box(),flex:17)
                ],
              ))),
    );
  }

  Widget Profile_box() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          border: Border(
              left: BorderSide(color: Colors.grey, width: 3),
              top: BorderSide(color: Colors.grey, width: 3),
              right: BorderSide(color: Colors.grey, width: 3)),
        ),
        child: Row(
          children: [
            Flexible(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue)),
                ),
                flex: 5),
            Flexible(
                child:
                    Container(color: Colors.white, child: Text(widget.user_id)),
                flex: 15),
          ],
        ));
  }

  Widget Title_box(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            left: BorderSide(color: Colors.grey, width: 3),
            right: BorderSide(color: Colors.grey, width: 3)),
      ),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(padding: EdgeInsets.only(left: 10),child: Text(widget.title)),
    );
  }

  Widget Image_box() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3,color: Colors.grey)
        ),
        padding: EdgeInsets.all(10),
        child: Container(
          color: Colors.black,
        ));
  }

  Widget Contents_box(){
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          border: Border(
              left: BorderSide(color: Colors.grey, width: 3),
              bottom: BorderSide(color: Colors.grey, width: 3),
              right: BorderSide(color: Colors.grey, width: 3)),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
            child: Text(widget.content ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,color: Colors.lightGreen,));
  }
}
