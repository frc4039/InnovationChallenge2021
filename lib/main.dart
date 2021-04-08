import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

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

class StatelessNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewTaskPage(),
    );
  }
}

class StatelessPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PetPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  TaskPage({Key key}) : super(key: key);
  @override
  _TaskPageState createState() => _TaskPageState();
}

class NewTaskPage extends StatefulWidget {
  NewTaskPage({Key key}) : super(key: key);
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class PetPage extends StatefulWidget {
  PetPage({Key key}) : super(key: key);
  @override
  _PetPageState createState() => _PetPageState();
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
      runApp(StatelessPetPage());
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
        title: Text(
          'Good Morning $name',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              runApp(StatelessNewTaskPage());
            },
          )
        ],
        backgroundColor: Colors.white,
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: navBar,
          elevation: 5),
    );
  }
}

enum TaskImportance { Highest, Medium, Least }

class _NewTaskPageState extends State<NewTaskPage> {
  TaskImportance _importance = TaskImportance.Highest;
  TextEditingController taskName = TextEditingController();
  bool isRepeatingTask = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create new task',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              runApp(StatelessTaskPage());
            },
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: taskName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task name',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: taskName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task details',
              ),
            ),
          ),
          Container(
            child: Text("Task importance"),
          ),
          ListTile(
            title: const Text('Highest'),
            leading: Radio(
              value: TaskImportance.Highest,
              groupValue: _importance,
              onChanged: (TaskImportance value) {
                setState(() {
                  _importance = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Medium'),
            leading: Radio(
              value: TaskImportance.Medium,
              groupValue: _importance,
              onChanged: (TaskImportance value) {
                setState(() {
                  _importance = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Least'),
            leading: Radio(
              value: TaskImportance.Least,
              groupValue: _importance,
              onChanged: (TaskImportance value) {
                setState(() {
                  _importance = value;
                });
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Repeating task?",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                new Switch(
                  value: isRepeatingTask,
                  onChanged: (bool newValue) {
                    setState(() {
                      isRepeatingTask = newValue;
                    });
                  },
                ),
              ]),
        ]),
      ),
    );
  }
}

class _PetPageState extends State<PetPage> {
  String petName = "pet";
  double petHappiness = 0.8;
  double petHunger = 0.1;
  void navBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      runApp(StatelessTaskPage());
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
        title: Text(
          'Pet',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Text("$petName stats"),
              Row(children: [
                Text(
                  "Happiness",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 70,
                  // set "70" to percent
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: (2500*petHappiness).toInt(),
                  percent: petHappiness,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.black,
                ),
              ]),
              Row(children: [
                Text(
                  "Hunger",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 70,
                  // set "70" to percent
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: (2500*petHunger).toInt(),
                  percent: petHunger,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.black,
                ),
              ]),
            ],
          ),
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: navBar,
          elevation: 5),
    );
  }
}
