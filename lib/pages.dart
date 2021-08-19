import 'dart:ui';

import 'package:flutter/material.dart';

int _coins = 0;
int _crystals = 0;

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to "My clicker"',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Are you ready to start?',style: TextStyle(fontSize: 20,)),
          Placeholder(
            fallbackHeight: 40,
          ),
          SizedBox(
            height: 100,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purpleAccent),
              ),
              child: Text('Press to start',style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
          ),
        ],
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pressCost = 1;

  void _plusCoins() {
    setState(() {
      _coins += _pressCost;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My clicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('You have $_coins coins and $_crystals crystals'),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(45)),
                  primary: Colors.deepOrangeAccent[100],
                  onPrimary: Colors.purple,
                  elevation: 30,
                  shadowColor: Colors.blueAccent,
                  minimumSize: Size(50, 80),
                  side: BorderSide(color: Colors.white30, width: 3),
                  animationDuration: Duration(milliseconds: 700),
                ),
                onPressed: () => _plusCoins(),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.add),
                      if (_pressCost != 1)
                        Text('$_pressCost coins')
                      else
                        Text('$_pressCost coin')
                    ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            icon: Icon(Icons.upload_sharp),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => print('people'),
          ),
          IconButton(
            icon: Icon(Icons.directions_car_sharp),
            onPressed: () => print('ac_unit'),
          ),
        ]),
      ),
    );
  }
}

class UpgradePage extends StatefulWidget {
  @override
  _UpgradePageState createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
