import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int value) {
    final player = AudioCache();
    player.play('note$value.wav');
  }

  Widget buttonSound(int value, Color color) {
    return Expanded(
      child: Container(
        color: color,
        child: InkWell(
          onTap: () {
            playSound(value);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buttonSound(1, Colors.red),
              buttonSound(2, Colors.orange),
              buttonSound(3, Colors.yellow),
              buttonSound(4, Colors.green),
              buttonSound(5, Colors.teal),
              buttonSound(6, Colors.blue),
              buttonSound(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
