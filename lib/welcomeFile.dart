import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;

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
  WelcomePage({Key key, @required this.storage}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    widget.storage.load();
  }

  String timeDay = DateFormat.jm().format(DateTime.now()).toString() +
      ", " +
      DateFormat.yMMMMd().format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Good ' + mainFile.tOD() + ' ' + mainFile.userName),
      content: const Text('How are you today?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            runApp(taskFile.StatelessTaskPage());
          },
          child: const Text('Good'),
        ),
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("There are people here for you"),
              content: const Text(
                  'We suggest reaching out to friends or trusted resources for help.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: const Text('Friends'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Resources'),
                ),
              ],
            ),
          ),
          child: const Text('Bad'),
        ),
      ],
    );
  }
}
