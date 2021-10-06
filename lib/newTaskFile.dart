import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;

enum TaskImportance { Highest, Medium, Least }

class StatelessNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewTaskPage(
        storage: mainFile.Storage(),
      ),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class NewTaskPage extends StatefulWidget {
  final mainFile.Storage storage;
  NewTaskPage({Key key, @required this.storage}) : super(key: key);
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TaskImportance _importance = TaskImportance.Highest;
  TextEditingController taskName = TextEditingController();
  TextEditingController taskDetails = TextEditingController();
  DateTime taskDate = DateTime.now();
  bool isRepeatingTask = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create new task',
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
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
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: TextField(
              controller: taskName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task name',
              ),
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          /*Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: taskDetails,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task details',
              ),
              style: TextStyle(fontSize: 20.0),
            ),
          ),*/
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.black,
                minimumSize: Size(256, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
              ),
              onPressed: () async {
                taskDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)));
                setState(() {});
              },
              child: Text('Date: ' + DateFormat('yyyy-MM-dd').format(taskDate)),
            ),
          ),
          Container(
            child: Text(
              "Task importance",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          ListTile(
            title: const Text(
              'Highest',
              style: TextStyle(fontSize: 20.0),
            ),
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
            title: const Text(
              'Medium',
              style: TextStyle(fontSize: 20.0),
            ),
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
            title: const Text(
              'Least',
              style: TextStyle(fontSize: 20.0),
            ),
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
          /*Row(children: [
            Text(
              "Repeating task?",
              style: TextStyle(fontSize: 24.0),
            ),
            Switch(
              value: isRepeatingTask,
              onChanged: (bool newValue) {
                setState(() {
                  isRepeatingTask = newValue;
                });
              },
            ),
          ]),*/
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.black,
                minimumSize: Size(256, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
              ),
              onPressed: () async {
                if (_importance == TaskImportance.Highest) {
                  widget.storage.newTask(taskName.text, taskDetails.text,
                      taskDate, 1, isRepeatingTask);
                } else if (_importance == TaskImportance.Medium) {
                  widget.storage.newTask(taskName.text, taskDetails.text,
                      taskDate, 2, isRepeatingTask);
                } else {
                  widget.storage.newTask(taskName.text, taskDetails.text,
                      taskDate, 3, isRepeatingTask);
                }
              },
              child: Text('Create Task'),
            ),
          ),
        ]),
      ),
    );
  }
}
