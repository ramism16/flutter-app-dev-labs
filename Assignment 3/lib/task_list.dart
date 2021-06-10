import 'package:assignment01/models/task.dart';
import 'package:assignment01/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TasksListPage extends StatefulWidget {
  @override
  _TasksListPageState createState() => _TasksListPageState();
}

class _TasksListPageState extends State<TasksListPage> {
  FirebaseFirestore firestore;
  CollectionReference tasks;

  @override
  void initState(){
    super.initState();
    firestore = FirebaseFirestore.instance;
    tasks = firestore.collection("tasks");
  }

  Future<List<Task>> getAllDocs()async{
    var snapshot = await tasks.get();
    var finalList = snapshot.docs.map((document) => Task.fromMap(document.data())).toList();
    finalList.sort((a,b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return finalList;
  }

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
                        Text("224248"),
                        Text("BSCS-7A"),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("MAD A3"),
                        Text("Batch 2017"),
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
            FutureBuilder<List<Task>>(
              future: getAllDocs(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data.isNotEmpty){
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){Navigator.of(context).pushNamed("/TaskDetail" , arguments: snapshot.data[index]);},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                            decoration: BoxDecoration(
                                color: snapshot.data[index].dueDate.isBefore(DateTime.now()) ? Colors.red : Colors.green,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              color: Colors.white,
                              child: ListTile(
                                title: Text(snapshot.data[index].name),
                                subtitle: Text(snapshot.data[index].subject),
                              )
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context,index2) => SizedBox(height: 10,),
                    ),
                  );
                }
                else{
                  if (snapshot.hasError)
                    print(snapshot.error);
                  return CircularProgressIndicator();
                }
              }
            ),
          ],
        )
    );
  }
}
