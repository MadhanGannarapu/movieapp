import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/model/movie.dart';

class MovieService {
  final String apiKey='66c81beb27f4e3d3b0bc23a86382024d';
  final String mainUrl='https://api.themoviedb.org/3';

  Future<List<Movie>> fetchNowPlayingMovies() async {

    final url =
        '$mainUrl/movie/now_playing?api_key=$apiKey&language=en-US&page1';

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["results"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<Movie>> searchMovies(String keyword) async {
    String url =
        '$mainUrl/search/movie?api_key=$apiKey&language=en-US&query=$keyword&page=1&include_adult=false';

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["results"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
