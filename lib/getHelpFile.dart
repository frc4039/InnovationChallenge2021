import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;

class StatelessGetHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetHelpPage(
        storage: mainFile.Storage(),
      ),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class GetHelpPage extends StatefulWidget {
  final mainFile.Storage storage;
  GetHelpPage({Key key, @required this.storage}) : super(key: key);
  @override
  _GetHelpPageState createState() => _GetHelpPageState();
}

class _GetHelpPageState extends State<GetHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Help',
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.black,
                minimumSize: Size(192, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                textStyle: TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
              ),
              onPressed: () {
                launch("tel://18006686868");
              },
              child: Text(
                "\nKid's Help Phone\n+1(800)668-6868\n",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.black,
                minimumSize: Size(192, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                textStyle: TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
              ),
              onPressed: () {
                launch("tel://18334564566");
              },
              child: Text(
                "\nCanada Suicide Prevention Service\n+1(833)456-4566\n",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.black,
                minimumSize: Size(192, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                textStyle: TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
              ),
              onPressed: () {
                launch("tel://16476944275");
              },
              child: Text(
                "\nLGBT Youthline Ontario\n+1(647)694-4275\n",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
