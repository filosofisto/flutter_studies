import 'package:flutter/material.dart';
import 'package:simple_http/service/network.dart';

class JsonParsingSimple extends StatefulWidget {
  const JsonParsingSimple({Key? key}) : super(key: key);

  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {

  late Future data;

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return createListView(snapshot.data, context);
                // return Text(snapshot.data[0]['title']);
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = new Network(url);

    return network.fechData();
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(height: 5.0,),
            ListTile(
              title: Text("${data[index]['title']}"),
              subtitle: Text("${data[index]['body']}"),
              leading: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 23,
                    child: Text("${data[index]['id']}"),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
