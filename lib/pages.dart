import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _coins = 0;
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
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(alignment: FractionalOffset(0.3, 0.3)),
            Text('You have $_coins coins'),
            SizedBox(
              height: 90,
              width: 160,
              child: OutlinedButton(
                onPressed: _plusCoins,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.add),
                      if (_pressCost != 1) Text('$_pressCost coins')else Text('$_pressCost coin')
                    ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to "My clicker"'),
      ),
      body: Center(
          child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.purpleAccent),
        ),
        child: Text('Press to start'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
      )),
    );
  }
}
