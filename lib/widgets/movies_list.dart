import 'package:flutter/material.dart';
import 'package:movieapp/viewmodel/nowplaying_movies_viewmodel.dart';
import 'package:movieapp/views/movie_details_screen.dart';

class MovieList extends StatelessWidget {
  final List<NowPlayigMoviesViewModel> movies;

  MovieList({this.movies});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];
        return ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(movie: movie),
            ),
          ),
          contentPadding: EdgeInsets.all(10),
          leading: Hero(
            tag: 'animateimage${movie.poster}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: movie.poster != null
                  ? FadeInImage(
                      width: 50.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/placeholder.jpg'),
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w185" + movie.poster,
                      ),
                    )
                  : Container(child: Image.asset('assets/placeholder.jpg')),
            ),
          ),
          title: Text(movie.title),
          trailing: Text(movie.voteAverage.toString()),
        );
      },
    );
  }
}
