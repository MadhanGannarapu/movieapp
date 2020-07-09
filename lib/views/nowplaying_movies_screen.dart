import 'package:flutter/material.dart';
import 'package:movieapp/viewmodel/nowplaying_movies_list_viewmodel.dart';
import 'package:movieapp/widgets/movies_list.dart';
import 'package:movieapp/widgets/no_data_found.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NowPlayingMovieListViewModel>(context, listen: false)
        .fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NowPlayingMovieListViewModel>(context);
    return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text("Now Playing Movies")),
        body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      vm.searchResultsMovies(value);
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _controller.clear();
                              vm.fetchMovies();
                            },
                          )
                        : null,
                  ),
                ),
              ),
              Expanded(
                child: vm.movies.length != 0
                    ? MovieList(movies: vm.movies)
                    : NoDataFound(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
