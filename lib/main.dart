import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int _selectedIndex = 0;

void main() {
  runApp(StatelessTaskPage());
}

class StatelessTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  TaskPage({Key key}) : super(key: key);
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String name = "test";
  String timeDay = DateFormat.jm().format(DateTime.now()).toString() +
      ", " +
      DateFormat.yMMMMd().format(DateTime.now()).toString();

  void navBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      //runApp(StatelessPetPage());
    } else if (index == 2) {
      //runApp(StatelessShopPage());
    } else if (index == 3) {
      //runApp(StatelessSettingsPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Morning $name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[Text("It is: " + timeDay)],
          ),
          Container(
            child: Text("Tasks for today are:"),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Tasks',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'Pet',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Shop',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Settings',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: navBar,
          elevation: 5),
    );
  }
}
