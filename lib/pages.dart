import 'package:flutter/material.dart';
import 'dart:ui';

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
            Align(
                alignment: FractionalOffset(0.3, 0.3),
                child:Text(
                    'Hello Flutter',
                    textDirection: TextDirection.ltr,   // текст слева направо
                    style: TextStyle(fontSize: 20) // высота шрифта 20
                )
            ),
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
                      Text('$_pressCost coin'),
                      if (_pressCost != 1) Text('s')
                    ]),
              ),
            ),
          ],
        ),
      ),
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
