import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;
import 'petFile.dart' as petFile;
import 'petSettingsFile.dart' as petSettingsFile;

enum TaskImportance { Highest, Medium, Least }

class StatelessNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewTaskPage(),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class NewTaskPage extends StatefulWidget {
  NewTaskPage({Key key}) : super(key: key);
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

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
              runApp(taskFile.StatelessTaskPage());
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
