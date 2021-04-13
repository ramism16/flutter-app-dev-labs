import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoverLetterPage extends StatefulWidget {
  @override
  _CoverLetterPageState createState() => _CoverLetterPageState();
}

class _CoverLetterPageState extends State<CoverLetterPage> {
  bool switchEnabled = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text("Cover Letter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cover Letter :", style: TextStyle(fontSize: 18),),
                    CupertinoSwitch(
                      activeColor: Colors.blue,
                      value: switchEnabled,
                      onChanged: (active){
                        setState(() {
                          switchEnabled = active;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible: switchEnabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name :", style: TextStyle(fontSize: 18),),
                      SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(),
                          labelText: "Date",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        validator: (inputVal){
                          if (inputVal.length > 0)
                            return null;
                          else
                            return "Please enter the date";
                        },
                      ),
                      SizedBox(height: 25,),
                      Text("Addressed to :", style: TextStyle(fontSize: 18),),
                      SizedBox(height: 15,),
                      TextFormField(
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                        ),
                        validator: (inputVal){
                          if (inputVal.length > 0)
                            return null;
                          else
                            return "Please enter who this is addressed to";
                        },
                      ),
                      SizedBox(height: 25,),
                      Text("Body :", style: TextStyle(fontSize: 18),),
                      SizedBox(height: 15,),
                      TextFormField(
                        maxLines: 12,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                        ),
                        validator: (inputVal){
                          if (inputVal.length > 0)
                            return null;
                          else
                            return "Please enter the body of your cover letter";
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
