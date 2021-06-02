class apiModel{
  int id;
  String title;
  bool completed;

  apiModel.fromJson(Map<String,dynamic> map){
    id = map['id'];
    title = map["title"];
    completed = map["completed"];
  }
}