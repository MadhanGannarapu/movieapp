import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/service/movie_service.dart';
import 'package:movieapp/viewmodel/nowplaying_movies_list_viewmodel.dart';
import 'package:movieapp/viewmodel/nowplaying_movies_viewmodel.dart';
import 'package:movieapp/views/nowplaying_movies_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Movies Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => NowPlayingMovieListViewModel(),
        child: MovieListPage(),
      ),
    );
  }
}
