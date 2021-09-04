import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 100.0,
            ),
            Container(
              color: Colors.teal,
              width: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 20.0,
                    width: 20.0,
                    color: Colors.yellowAccent,
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    color: Colors.yellowAccent[500],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              width: 100.0,
            )
          ],
        )),
      ),
    );
  }
}
