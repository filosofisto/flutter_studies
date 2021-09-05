import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDicee = random();
  int rightDicee = random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDicee = random();
                  });
                },
                child: Image.asset('images/dice$leftDicee.png')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    rightDicee = random();
                  });
                },
                child: Image.asset('images/dice$rightDicee.png')),
          ),
        ],
      ),
    );
  }

  static int random() {
    return Random().nextInt(6) + 1;
  }
}

