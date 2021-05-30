import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'taskFile.dart' as taskFile;

int selectedIndex = 0;

String petName = "Paws";
String userName = "";
double petHappiness = 1.0;
double petHunger = 1.0;
double petHealth = 1.0;

void main() => runApp(taskFile.StatelessTaskPage());
