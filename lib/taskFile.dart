import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'main.dart' as mainFile;
import 'newTaskFile.dart' as newTaskFile;
import 'petFile.dart' as petFile;
import 'settingsFile.dart' as settingsFile;

class StatelessTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class TaskPage extends StatefulWidget {
  TaskPage({Key key}) : super(key: key);
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String timeDay = DateFormat.jm().format(DateTime.now()).toString() +
      ", " +
      DateFormat.yMMMMd().format(DateTime.now()).toString();

  void navBar(int index) {
    setState(() {
      mainFile.selectedIndex = index;
    });
    if (index == 1) {
      runApp(petFile.StatelessPetPage());
    } else if (index == 2) {
      //runApp(shopFile.StatelessShopPage());
    } else if (index == 3) {
      runApp(settingsFile.StatelessSettingsPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Good ' + mainFile.tOD() + ' ' + mainFile.userName,
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              runApp(newTaskFile.StatelessNewTaskPage());
            },
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "It is: " + timeDay,
                style: TextStyle(fontSize: 24.0),
              )
            ],
          ),
          Container(
            child: Text(
              "Tasks for today are:",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (mainFile.highestPriorityToday.length == 0 &&
                  mainFile.mediumPriorityToday.length == 0 &&
                  mainFile.leastPriorityToday.length == 0)
                Text(
                    "\nThere are no tasks for today,\nWhy not try adding some?",
                    style: TextStyle(fontSize: 24.0)),
              Column(
                children: [
                  for (var i in mainFile.highestPriorityToday)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.black,
                          minimumSize: Size(192, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle:
                              TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
                        ),
                        onPressed: () {},
                        child: Text(i),
                      ),
                    ),
                  for (var i in mainFile.mediumPriorityToday)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.black,
                          minimumSize: Size(192, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle:
                              TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
                        ),
                        onPressed: () {},
                        child: Text(i),
                      ),
                    ),
                  for (var i in mainFile.leastPriorityToday)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.black,
                          minimumSize: Size(192, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle:
                              TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
                        ),
                        onPressed: () {},
                        child: Text(i),
                      ),
                    ),
                ],
              ),
              Column(
                children: [
                  for (var i in mainFile.highestPriorityToday)
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.green,
                          minimumSize: Size(48, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle:
                              TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
                        ),
                        onPressed: () {},
                        child: Text('✓'),
                      ),
                    ),
                  for (var i in mainFile.mediumPriorityToday)
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.green,
                          minimumSize: Size(48, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle:
                              TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
                        ),
                        onPressed: () {},
                        child: Text('✓'),
                      ),
                    ),
                  for (var i in mainFile.leastPriorityToday)
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.green,
                          minimumSize: Size(48, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle:
                              TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
                        ),
                        onPressed: () {},
                        child: Text('✓'),
                      ),
                    ),
                ],
              ),
              Column(
                children: [
                  for (var i in mainFile.highestPriorityToday)
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.red,
                            minimumSize: Size(48, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: TextStyle(
                                fontSize: 24.0, fontFamily: 'RopaSans'),
                          ),
                          onPressed: () {},
                          child: Text('✘'),
                        )),
                  for (var i in mainFile.mediumPriorityToday)
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.red,
                            minimumSize: Size(48, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: TextStyle(
                                fontSize: 24.0, fontFamily: 'RopaSans'),
                          ),
                          onPressed: () {},
                          child: Text('✘'),
                        )),
                  for (var i in mainFile.leastPriorityToday)
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.red,
                            minimumSize: Size(48, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: TextStyle(
                                fontSize: 24.0, fontFamily: 'RopaSans'),
                          ),
                          onPressed: () {},
                          child: Text('✘'),
                        )),
                ],
              ),
            ],
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Tasks',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'Pet',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Shop',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Settings',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: mainFile.selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: navBar,
          elevation: 5),
    );
  }
}
