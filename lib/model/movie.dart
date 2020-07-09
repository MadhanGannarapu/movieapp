import 'package:intl/intl.dart';

class Movie {
  final int id;
  final String title;
  final String poster;
  final String backdropPath;
  final int voteCount;
  final String originalLanguage;
  final double voteAvg;
  final String overview;
  final String releaseDate;
  final double popularity;
  final bool adult;

  Movie({
    this.id,
    this.title,
    this.voteAvg,
    this.poster,
    this.originalLanguage,
    this.overview,
    this.releaseDate,
    this.backdropPath,
    this.voteCount,
    this.popularity,this.adult
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    
    var parsedDate = DateTime.parse(parsedJson['release_date']);
    var date = DateFormat.yMMMMd('en_US').format(parsedDate);

    return Movie(
      id: parsedJson['id'],
      title: parsedJson["title"],
      voteAvg: parsedJson["vote_average"].toDouble(),
      poster: parsedJson["poster_path"],
      backdropPath: parsedJson['backdrop_path'],
      originalLanguage: parsedJson["original_language"],
      overview: parsedJson['overview'],
      releaseDate: date??null,
      voteCount: parsedJson['vote_count'],
      popularity: parsedJson['popularity'].toDouble(),
      adult: parsedJson['adult']
    );
  }
}
