import 'package:flutter/material.dart';

import 'custom/custom_button.dart';

class ScaffoldExample extends StatelessWidget {
  _onAlarmButtonPressed() {
    debugPrint("Alarmed button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        backgroundColor: Colors.amberAccent.shade400,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email Tapped!!")),
          IconButton(
              icon: Icon(Icons.access_alarm), onPressed: _onAlarmButtonPressed),
        ],
      ),
      backgroundColor: Colors.redAccent.shade100,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.call_missed),
        onPressed: () => debugPrint("Missed calls!"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Unit"),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "Alarm"),
      ], onTap: (index) => debugPrint("Tapped $index"),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton()
            ]),
      ),
    );
  }
}

