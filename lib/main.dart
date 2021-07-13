import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'welcomeFile.dart' as welcomeFile;
import 'taskFile.dart' as taskFile;

int selectedIndex = 0;

String petName = "Paws";
String userName = "";
double petHappiness = 1.0;
double petHunger = 1.0;
double petHealth = 1.0;
List<String> highestPriorityToday = [];
List<String> mediumPriorityToday = [];
List<String> leastPriorityToday = [];
List<String> highestPriorityUpcoming = [];
List<String> mediumPriorityUpcoming = [];
List<String> leastPriorityUpcoming = [];

String tOD() {
  int currentHour = int.tryParse(DateFormat.H().format(DateTime.now()));
  if (currentHour < 12) {
    return "morning";
  } else if (currentHour < 18) {
    return "afternoon";
  } else if (currentHour < 21) {
    return "evening";
  }
  return "night";
}

class Storage {
  void newTask(String name, String details, DateTime date, int importance,
      bool repeating) async {
    String contents = name +
        "\n" +
        details +
        "\n" +
        date.microsecondsSinceEpoch.toString() +
        "\n" +
        importance.toString() +
        "\n" +
        repeating.toString();
    final fn = ((new DateTime.now()).millisecondsSinceEpoch).toString();
    final path = (await getApplicationDocumentsDirectory()).path;
    new Directory(path + "/tasks").create();
    final file = File(path + "/tasks/" + fn);
    file.writeAsString(contents);
    load();
  }

  /*void newFriend(String name, String number, String tag, int platform,
      bool repeating) async {
    String contents =
        name + "\n" + number + "\n" + tag + "\n" + platform.toString();
    final fn = ((new DateTime.now()).millisecondsSinceEpoch).toString();
    final path = (await getApplicationDocumentsDirectory()).path;
    new Directory(path + "/friends").create();
    final file = File(path + "/friends/" + fn);
    file.writeAsString(contents);
  }*/

  void load() async {
    highestPriorityToday = [];
    mediumPriorityToday = [];
    leastPriorityToday = [];
    highestPriorityUpcoming = [];
    mediumPriorityUpcoming = [];
    leastPriorityUpcoming = [];
    final path = (await getApplicationDocumentsDirectory()).path;
    Directory("$path/tasks").list().forEach((i) async {
      List task = (await File(i.path).readAsString()).split("\n");
      if (DateTime.now().microsecondsSinceEpoch >= int.parse(task[2])) {
        if (task[3] == "1") {
          highestPriorityToday.add(task[0]);
        } else if (task[3] == "2") {
          mediumPriorityToday.add(task[0]);
        } else {
          leastPriorityToday.add(task[0]);
        }
      } else {
        if (task[3] == "1") {
          highestPriorityUpcoming.add(task[0]);
        } else if (task[3] == "2") {
          mediumPriorityUpcoming.add(task[0]);
        } else {
          leastPriorityUpcoming.add(task[0]);
        }
      }
      runApp(taskFile.StatelessTaskPage());
    });
  }

  void closeTask(bool taskCompleted, String taskName) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    await Directory("$path/tasks").list().forEach((i) async {
      List task = (await File(i.path).readAsString()).split("\n");
      if (taskName == task[0]) {
        await i.delete();
      }
    });
    load();
  }
}

void main() => runApp(welcomeFile.StatelessWelcomePage());
