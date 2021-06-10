class Task {
  String name;
  String subject;
  DateTime dueDate;
  int marks;
  bool completed;
  int obtainedMarks;

  Task.fromMap(Map<String, dynamic> map){
    name = map["name"];
    subject = map["subject"];
    dueDate = map['dueDate'].toDate();
    marks = map["marks"];
    completed = map["completed"];
    obtainedMarks = map["obtainedMarks"];
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : this.name,
      'subject' : this.subject,
      'dueDate' : this.dueDate,
      'marks' : this.marks,
      'completed' : this.completed,
      'obtainedMarks' : this.obtainedMarks
    };
  }
}