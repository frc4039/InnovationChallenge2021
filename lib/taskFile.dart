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
      home: TaskPage(
        storage: mainFile.Storage(),
      ),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class TaskPage extends StatefulWidget {
  final mainFile.Storage storage;
  TaskPage({Key key, @required this.storage}) : super(key: key);
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
              "\nTasks for today are:",
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
                  Text("There are no tasks for today.\n",
                      style: TextStyle(fontSize: 24.0, color: Colors.grey)),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                        onPressed: () async {
                          await widget.storage.closeTask(true, i);
                          setState(() {});
                        },
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
                        onPressed: () async {
                          await widget.storage.closeTask(true, i);
                          setState(() {});
                        },
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
                        onPressed: () async {
                          await widget.storage.closeTask(true, i);
                          setState(() {});
                        },
                        child: Text('✓'),
                      ),
                    ),
                ],
              ),
              /*Column(
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
                          onPressed: () async {
                            await widget.storage.closeTask(false, i);
                            setState(() {});
                          },
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
                          onPressed: () async {
                            await widget.storage.closeTask(false, i);
                            setState(() {});
                          },
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
                          onPressed: () async {
                            await widget.storage.closeTask(false, i);
                            setState(() {});
                          },
                          child: Text('✘'),
                        )),
                ],
              ),*/
            ],
          ),
          Container(
            child: Text(
              "\nUpcoming tasks are:",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (mainFile.highestPriorityUpcoming.length == 0 &&
                    mainFile.mediumPriorityUpcoming.length == 0 &&
                    mainFile.leastPriorityUpcoming.length == 0)
                  Text(
                      "There are no upcoming tasks.\nWhy not try adding some?\n",
                      style: TextStyle(fontSize: 24.0, color: Colors.grey)),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  for (var i in mainFile.highestPriorityUpcoming)
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
                  for (var i in mainFile.mediumPriorityUpcoming)
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
                  for (var i in mainFile.leastPriorityUpcoming)
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
                  for (var i in mainFile.highestPriorityUpcoming)
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
                        onPressed: () async {
                          await widget.storage.closeTask(true, i);
                          setState(() {});
                        },
                        child: Text('✓'),
                      ),
                    ),
                  for (var i in mainFile.mediumPriorityUpcoming)
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
                        onPressed: () async {
                          await widget.storage.closeTask(true, i);
                          setState(() {});
                        },
                        child: Text('✓'),
                      ),
                    ),
                  for (var i in mainFile.leastPriorityUpcoming)
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
                        onPressed: () async {
                          await widget.storage.closeTask(true, i);
                          setState(() {});
                        },
                        child: Text('✓'),
                      ),
                    ),
                ],
              ),
              /*Column(
                children: [
                  for (var i in mainFile.highestPriorityUpcoming)
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
                          onPressed: () async {
                            await widget.storage.closeTask(false, i);
                            setState(() {});
                          },
                          child: Text('✘'),
                        )),
                  for (var i in mainFile.mediumPriorityUpcoming)
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
                          onPressed: () async {
                            await widget.storage.closeTask(false, i);
                            setState(() {});
                          },
                          child: Text('✘'),
                        )),
                  for (var i in mainFile.leastPriorityUpcoming)
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
                          onPressed: () async {
                            await widget.storage.closeTask(false, i);
                            setState(() {});
                          },
                          child: Text('✘'),
                        )),
                ],
              ),*/
            ],
          ),
        ]),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
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
          elevation: 5),*/
    );
  }
}
