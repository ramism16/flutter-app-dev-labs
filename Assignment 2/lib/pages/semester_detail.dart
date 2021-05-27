import 'package:assignment01/model/student.dart';
import 'package:flutter/material.dart';

class SemesterDetailPage extends StatelessWidget {
  int index;
  SemesterDetailPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(Student.instance.semesters[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Student.instance.gpas[index] != -1.00) Align(alignment: Alignment.centerRight, child: Text("Term GPA: ${Student.instance.gpas[index]}", style: Theme.of(context).textTheme.headline6,),),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: Student.instance.courses[index].length,
                itemBuilder: (context, index1){
                  return ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    tileColor: Student.instance.grades[index][index1] == "A" ? Colors.yellowAccent : null,
                    title: Text(Student.instance.courses[index][index1]),
                    trailing: Text(Student.instance.grades[index][index1], style: TextStyle(fontSize: 16),),
                    subtitle: Student.instance.courses[index][index1].contains("()") ? Text("Elective", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),) : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
