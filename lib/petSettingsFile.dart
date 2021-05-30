import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;
import 'newTaskFile.dart' as newTaskFile;
import 'petFile.dart' as petFile;

class StatelessPetSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PetSettingsPage(),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class PetSettingsPage extends StatefulWidget {
  PetSettingsPage({Key key}) : super(key: key);
  @override
  _PetSettingsPageState createState() => _PetSettingsPageState();
}

class _PetSettingsPageState extends State<PetSettingsPage> {
  TextEditingController petNameController = TextEditingController();
  bool isRepeatingTask = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet settings',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                mainFile.petName = petNameController.text;
              });
              runApp(petFile.StatelessPetPage());
            },
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: petNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet name',
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
