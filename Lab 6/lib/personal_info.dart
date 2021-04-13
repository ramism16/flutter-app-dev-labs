import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final formKey = GlobalKey<FormState>();
  bool switchEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Personal Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name :", style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (inputVal){
                    if (inputVal.length > 0)
                      return null;
                    else
                      return "Please enter your name";
                  },
                ),
                SizedBox(height: 25,),
                Text("Address :", style: TextStyle(fontSize: 18),),
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
                      return "Please enter your address";
                  },
                ),
                SizedBox(height: 25,),
                Text("Email :", style: TextStyle(fontSize: 18),),
                SizedBox(height: 15,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (inputVal){
                    if (inputVal.length > 0)
                      return null;
                    else
                      return "Please enter your email";
                  },
                ),
                SizedBox(height: 25,),
                Text("Number :", style: TextStyle(fontSize: 18),),
                SizedBox(height: 15,),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (inputVal){
                    if (inputVal.length > 0)
                      return null;
                    else
                      return "Please enter your phone number";
                  },
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Photo :", style: TextStyle(fontSize: 18),),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
