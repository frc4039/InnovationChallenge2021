import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

String tOD() {
  int currentHour = int.tryParse(DateFormat.H().format(DateTime.now()));
  if (currentHour < 12) {
    return "Morning";
  } else if (currentHour < 18) {
    return "Afternoon";
  } else if (currentHour < 21) {
    return "Evening";
  }
  return "Night";
}

void main() => runApp(taskFile.StatelessTaskPage());
