import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Student {
  String name;
  int cmsID;
  int classYear;
  int batch;
  String section;
  double cgpa;
  List<String> semesters = [];
  List<List<dynamic>> courses = [];
  List<List<dynamic>> grades = [];
  List<double> gpas = [];

  Student._internal();
  static final Student instance = Student._internal();

  //skip factory constructor, fetching data from json

  static void fromMap(Map<String, dynamic> map){
    instance.name = map["name"];
    instance.cmsID = map["cms"];
    instance.classYear = map["class"];
    instance.batch = map["batch"];
    instance.section = map["section"];
    instance.cgpa = map["cgpa"];
    map["semesters"].forEach((semester) {instance.semesters.add(semester);});
    map["courses"].forEach((list) {instance.courses.add(list);});
    map["grades"].forEach((list) {instance.grades.add(list);});
    map["gpas"].forEach((gpa) {instance.gpas.add(gpa);});
  }

  //skipping toMap, only fetching not writing data\
  static Future readState() async {
    try {
      final jsonString = await rootBundle.loadString("assets/224248.json");
      final jsonMap = json.decode(jsonString);
      fromMap(jsonMap);
    }
    catch (e,trace){
      print("Student readstate error: " + e.toString() + trace.toString());
    }
  }

  //skipping save and delete state, not needed
}