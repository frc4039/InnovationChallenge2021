import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;
import 'petFile.dart' as petFile;

class StatelessSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  TextEditingController petNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool isRepeatingTask = false;

  void navBar(int index) {
    setState(() {
      mainFile.selectedIndex = index;
    });
    if (index == 0) {
      runApp(taskFile.StatelessTaskPage());
    } else if (index == 1) {
      runApp(petFile.StatelessPetPage());
    } else if (index == 2) {
      //runApp(shopFile.StatelessShopPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.black,
              minimumSize: Size(256, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
            ),
            onPressed: () {},
            child: Text('Reach Out'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.black,
                minimumSize: Size(256, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: TextStyle(fontSize: 24.0, fontFamily: 'RopaSans'),
              ),
              onPressed: () {},
              child: Text('Resources'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: TextField(
              controller: userNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User name',
              ),
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: TextField(
              controller: petNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet name',
              ),
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Tasks',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'Pet',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Shop',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Settings',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: mainFile.selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: navBar,
          elevation: 5),
    );
  }
}
