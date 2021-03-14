import 'package:flutter/material.dart';
import 'package:ramis_lab2/main.dart';

class myDrawer extends StatelessWidget {
  String accountUsername;
  myDrawer(this.accountUsername);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            accountName: Text("new user"),
            accountEmail: Text(accountUsername),
            currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("files/flutter-logo.png",)),
          ),
          ListTile(
            leading: Icon(Icons.home,size: 30,),
            title: Text("Home (+Task #3)"),
            onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(Icons.home)));},
          ),
          ListTile(
            leading: Icon(Icons.person, size: 30,),
            title: Text("Account"),
            onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AccountScreen(Icons.person)));},
          ),
          ListTile(
            leading: Icon(Icons.post_add, size: 30,),
            title: Text("News Feed"),
            onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FeedScreen(Icons.post_add)));},
          ),
          ListTile(
            leading: Icon(Icons.help, size: 30,),
            title: Text("Help"),
            onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HelpScreen(Icons.help)));},
          ),
          ListTile(
            leading: Icon(Icons.feedback, size: 30,),
            title: Text("Feedback"),
            onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FeedbackScreen(Icons.feedback)));},
          ),
          ListTile(
            leading: Icon(Icons.tab, size: 30),
            title: Text("Task #2 (tabviews)"),
            onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TabsScreen()));},
          )
        ],
      ),
    );
  }
}
