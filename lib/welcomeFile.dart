import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;
import 'getHelpFile.dart' as getHelpFile;

class StatelessWelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(
        storage: mainFile.Storage(),
      ),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class WelcomePage extends StatefulWidget {
  final mainFile.Storage storage;
  WelcomePage({Key? key, required this.storage}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    widget.storage.load(false);
  }

  String timeDay = DateFormat.jm().format(DateTime.now()).toString() +
      ", " +
      DateFormat.yMMMMd().format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Paws Abilities (Beta)"),
      content: Text("Welcome to Paws Abilities!" + "\n" + "How are you today?"),
      actions: <Widget>[
        TextButton(
          onPressed: () => runApp(getHelpFile.StatelessGetHelpPage()),
          child: const Text('Bad'),
        ),
        TextButton(
          onPressed: () => runApp(taskFile.StatelessTaskPage()),
          child: const Text('Good'),
        ),
      ],
    );
  }
}
