import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'taskFile.dart' as TaskFile;
import 'newTaskFile.dart' as NewTaskFile;
import 'petFile.dart' as PetFile;
import 'petSettingsFile.dart' as PetSettingsFile;

int selectedIndex = 0;

String petName = "Pet";
double petHappiness = 0.8;
double petHunger = 0.1;

void main() {
  runApp(TaskFile.StatelessTaskPage());
}
