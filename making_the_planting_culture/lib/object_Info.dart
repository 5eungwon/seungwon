class object_info{
  String? Img;
  String? Id;
  String? Nickname;

  object_info({
    this.Img,
    this.Id,
    this.Nickname,
});

}

class Post_info{
  String? id;
  String? user_id;
  String? title;
  String? content;
  String? image;

  Post_info({
    this.id,
    this.user_id,
    this.title,
    this.content,
    this.image
});
  Post_info.fromJson(Map<String,dynamic> json){
    id= json["id"];
    title= json["title"];
    user_id= json["user_id"];
    content= json["content"];
    image= json["image"];
  }
}

String baseUrl ="192.168.0.111";