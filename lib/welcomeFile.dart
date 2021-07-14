import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';

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
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    widget.storage.load(false);
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  String timeDay = DateFormat.jm().format(DateTime.now()).toString() +
      ", " +
      DateFormat.yMMMMd().format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_packageInfo.appName),
      content: Text("Preview build " +
          _packageInfo.version +
          "+" +
          _packageInfo.buildNumber +
          "\n" +
          _packageInfo.packageName),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            runApp(taskFile.StatelessTaskPage());
          },
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
