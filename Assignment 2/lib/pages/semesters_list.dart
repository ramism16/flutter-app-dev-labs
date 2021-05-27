import 'package:assignment01/model/student.dart';
import 'package:assignment01/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SemestersListPage extends StatefulWidget {
  @override
  _SemestersListPageState createState() => _SemestersListPageState();
}

class _SemestersListPageState extends State<SemestersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        children: [
          DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("CMS: ${Student.instance.cmsID}"),
                      Text("CGPA: ${Student.instance.cgpa.toStringAsFixed(2)}")
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Class of ${Student.instance.classYear}"),
                      Text("Batch of ${Student.instance.batch}"),
                      Text(Student.instance.section),
                    ],
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              itemCount: Student.instance.semesters.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){Navigator.of(context).pushNamed("/SemesterDetails", arguments: index);},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    decoration: BoxDecoration(
                      color: index == Student.instance.gpas.length - 1 ? Colors.yellow : Student.instance.gpas[index] > 3
                        ? Colors.blue : Student.instance.gpas[index] > 2 ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Semester ${index + 1}", style: Theme.of(context).textTheme.subtitle1,),
                                Text(Student.instance.gpas[index] != -1.00 ? "GPA: ${Student.instance.gpas[index]}": "", style: Theme.of(context).textTheme.subtitle1,)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text("${Student.instance.semesters[index]}"),
                            SizedBox(height: 5,),
                            Text("Courses: ${Student.instance.courses[index].length}")
                          ],
                        )
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context,index2) => SizedBox(height: 10,),
            ),
          ),
        ],
      )
    );
  }
}
