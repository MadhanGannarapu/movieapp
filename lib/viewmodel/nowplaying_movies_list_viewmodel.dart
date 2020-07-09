import 'package:flutter/material.dart';
import 'package:movieapp/service/movie_service.dart';
import 'package:movieapp/viewmodel/nowplaying_movies_viewmodel.dart';

class NowPlayingMovieListViewModel extends ChangeNotifier {
  List<NowPlayigMoviesViewModel> movies = List<NowPlayigMoviesViewModel>();

  Future<void> fetchMovies() async {
    final results = await MovieService().fetchNowPlayingMovies();
    this.movies =
        results.map((item) => NowPlayigMoviesViewModel(movie: item)).toList();
    notifyListeners();
  }

  Future<void> searchResultsMovies(String keyword) async {
    final results = await MovieService().searchMovies(keyword);
    this.movies =
        results.map((item) => NowPlayigMoviesViewModel(movie: item)).toList();
    notifyListeners();
  }
}
