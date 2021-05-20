import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'taskFile.dart' as taskFile;
import 'newTaskFile.dart' as newTaskFile;
import 'petFile.dart' as petFile;
import 'petSettingsFile.dart' as petSettingsFile;

int selectedIndex = 0;

String petName = "Pet";
double petHappiness = 0.8;
double petHunger = 0.1;

void main() => runApp(taskFile.StatelessTaskPage());
