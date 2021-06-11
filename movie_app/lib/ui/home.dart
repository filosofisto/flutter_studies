import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  // const MovieListView({Key? key}) : super(key: key);

  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "300",
    "Vikings",
    "I am the legend",
    "The Last of Mohicans"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 4.5,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(13.9)
                    ),
                    child: Text(movies[index].substring(0,1)),
                  ),
                ),
                title: Text(movies[index]),
                subtitle: Text("sub"),
                trailing: Text("..."),
                onTap: () => debugPrint("Movie name: ${movies[index]}"),
              ),
            );
          }),
    );
  }
}
