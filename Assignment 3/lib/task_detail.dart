import 'package:assignment01/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatefulWidget {
  Task task;
  TaskDetail(this.task);
  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(widget.task.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(widget.task.subject + " " + widget.task.name, style: Theme.of(context).textTheme.headline4,),
            SizedBox(height: 10,),
            Text("Marks ${widget.task.completed
                || (widget.task.dueDate.isBefore(DateTime.now()) && !widget.task.completed)
                ? widget.task.obtainedMarks
                : "-"}/${widget.task.marks}", style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 10,),
            Text(widget.task.completed ? "Completed" : "Not Completed",
              style: TextStyle(color: widget.task.completed ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(height: 40,),
            Text(DateFormat.yMMMEd().add_jm().format(widget.task.dueDate), style: TextStyle(fontSize: 18),)
          ],
        ),
      )
    );
  }
}
