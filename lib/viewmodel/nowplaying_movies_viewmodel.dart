import 'package:movieapp/model/movie.dart';

class NowPlayigMoviesViewModel {
  
  final Movie movie;
  NowPlayigMoviesViewModel({this.movie});

  int get id => this.movie.id;
  String get title => this.movie.title;
  String get poster => this.movie.poster;
  double get voteAverage => this.movie.voteAvg;
  String get originalLanguage => this.movie.originalLanguage;
  String get overview => this.movie.overview;
  String get backdropPath => this.movie.backdropPath;
  String get releaseDate => this.movie.releaseDate;
  int get voteCount => this.movie.voteCount;
  double get popularity => this.movie.popularity;
  bool get adult => this.movie.adult;
  
}
