import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'main.dart' as mainFile;
import 'taskFile.dart' as taskFile;
import 'settingsFile.dart' as settingsFile;

class StatelessPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PetPage(),
      theme: ThemeData(fontFamily: 'RopaSans'),
    );
  }
}

class PetPage extends StatefulWidget {
  PetPage({Key? key}) : super(key: key);
  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  void navBar(int index) {
    setState(() {
      mainFile.selectedIndex = index;
    });
    if (index == 0) {
      runApp(taskFile.StatelessTaskPage());
    } else if (index == 2) {
      //runApp(StatelessShopPage());
    } else if (index == 3) {
      runApp(settingsFile.StatelessSettingsPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet',
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                mainFile.petName + "'s stats",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Happiness",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Hunger",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Health",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ]),
                  Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.5,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration:
                            (2500 * mainFile.petHappiness).toInt(),
                        percent: mainFile.petHappiness,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.5,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration:
                            (250 + 2500 * mainFile.petHunger).toInt(),
                        percent: mainFile.petHunger,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.5,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration:
                            (500 + 2500 * mainFile.petHunger).toInt(),
                        percent: mainFile.petHealth,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.black,
                      ),
                    ),
                  ]),
                ])
          ]),
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
