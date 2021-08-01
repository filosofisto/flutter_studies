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
        backgroundColor: Colors.blueGrey.shade900,
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: <Widget>[
                movieCard(movieList[index], context),
                Positioned(top: 10.0, child: movieImage(movieList[index]))
              ]);
            }));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating} / 100",
                        style: mainTextStyle(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(movie.rated, style: mainTextStyle())
                    ],
                  )
                ],
              ),
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

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 15.0, color: Colors.grey);
  }

  Widget movieImage(Movie movie) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(movie.images[0]), fit: BoxFit.cover)),
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
      body: ListView(
        children: <Widget>[
          MovieDetailThumbnail(thumbnail: movie.images[0],)
        ],
      ),
    );
  }
}

class MovieDetailThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(thumbnail), fit: BoxFit.cover),
            ),
          ),
          Icon(Icons.play_circle_outline, size: 110, color: Colors.white,)
        ],
      )
    ]);
  }
}
