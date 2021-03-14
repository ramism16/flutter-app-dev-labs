import 'package:flutter/material.dart';
import 'package:ramis_lab2/main.dart';

import 'myAppBar.dart';
import 'myDrawer.dart';

class HomeScreen2 extends StatelessWidget {
  IconData screenIcon;
  HomeScreen2(this.screenIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      bottomNavigationBar: myNavBar(1),
      drawer: myDrawer(accountName),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(screenIcon, size: 60,),
            Text("Home page #1 (tab 2)", style: TextStyle(color: Colors.blue, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

class HomeScreen3 extends StatelessWidget {
  IconData screenIcon;
  HomeScreen3(this.screenIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      bottomNavigationBar: myNavBar(2),
      drawer: myDrawer(accountName),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(screenIcon, size: 60,),
            Text("Home page #1 (tab 3)", style: TextStyle(color: Colors.blue, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

class myNavBar extends StatefulWidget {
  int index;
  myNavBar(this.index);

  @override
  _myNavBarState createState() => _myNavBarState();
}

class _myNavBarState extends State<myNavBar> {
  int _selectedIndex;

  @override
  void initState(){
    this._selectedIndex = widget.index;
    super.initState();
  }

  Map<int, Widget> routes = {
    0: HomeScreen(Icons.home),
    1: HomeScreen2(Icons.home),
    2: HomeScreen3(Icons.home),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (routes[index] != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => routes[index])
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      elevation: 6,
      showSelectedLabels: true,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
      unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          label: 'Home Tab 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home Tab 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home Tab 3',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
