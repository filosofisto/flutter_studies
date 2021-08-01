import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class MovieListView extends StatelessWidget {
  // const MovieListView({Key? key}) : super(key: key);

  final List<Movie> movieList = Movie.getMovies();

  final List movie = [
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
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return movieCard(movieList[index], context);
            // return Card(
            //   color: Colors.white,
            //   elevation: 4.5,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: NetworkImage(movieList[index].images[0]),
            //             fit: BoxFit.cover
            //           ),
            //             color: Colors.blue,
            //             borderRadius: BorderRadius.circular(13.9)),
            //         child: null ,
            //       ),
            //     ),
            //     title: Text(movieList[index].title),
            //     subtitle: Text(movieList[index].genre),
            //     trailing: Text("..."),
            //     onTap: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => MovieListDetailView(movie: movieList[index],)));
            //     },
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(movie.title),
                    Text("Rating: ${movie.imdbRating} / 100")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Released: ${movie.released}"),
                    Text(movie.runtime),
                    Text(movie.rated)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListDetailView(
                      movie: movie,
                    )));
      },
    );
  }
}

class MovieListDetailView extends StatelessWidget {
  final Movie movie;

  const MovieListDetailView({Key key, this.movie}) : super(key: key);

  // const MovieListDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.movie.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
