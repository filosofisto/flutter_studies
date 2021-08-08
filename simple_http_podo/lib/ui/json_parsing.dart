import 'package:flutter/material.dart';
import 'package:simple_http_podo/model/post.dart';
import 'package:simple_http_podo/service/network.dart';

class JsonParsingSimple extends StatefulWidget {
  const JsonParsingSimple({Key? key}) : super(key: key);

  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {

  late Future<PostList> data;

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
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshot) {
              if (snapshot.hasData) {
                return createListView(snapshot.data!.posts, context);
                // return Text(snapshot.data[0]['title']);
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<PostList> getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = new Network(url);

    return network.fechData();
  }

  Widget createListView(List<Post> posts, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(height: 5.0,),
            ListTile(
              title: Text("${posts[index].title}"),
              subtitle: Text("${posts[index].body}"),
              leading: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 23,
                    child: Text("${posts[index].id}"),
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
