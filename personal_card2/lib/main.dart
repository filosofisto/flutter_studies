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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/edu.png'),
              ),
              Text(
                'Eduardo Silva',
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'ArchitecsDaughter',
                    color: Colors.white),
              ),
              Text(
                'Fullstack Developer',
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Confortaa',
                    color: Colors.teal.shade100),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      "+48 589 685 745",
                      style: TextStyle(
                          color: Colors.teal.shade900, fontSize: 20.0),
                    )),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      "filosofisto@gmail.com",
                      style: TextStyle(
                          color: Colors.teal.shade900, fontSize: 20.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
