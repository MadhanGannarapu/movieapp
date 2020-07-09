import 'package:flutter/material.dart';
import 'package:movieapp/viewmodel/nowplaying_movies_viewmodel.dart';
import 'package:movieapp/widgets/count_card.dart';
import 'package:movieapp/widgets/rating.dart';

class MovieDetailsScreen extends StatelessWidget {
  final NowPlayigMoviesViewModel movie;
  MovieDetailsScreen({this.movie});

  @override 
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
    
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: movie.backdropPath != null
                              ? NetworkImage(
                                  "https://image.tmdb.org/t/p/w185" +
                                      movie.backdropPath,
                                )
                              : AssetImage('assets/placeholder.jpg'),
                        ),
                      ),
                      width: double.infinity,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.3),
                      padding: EdgeInsets.only(
                        top: size.height * 0.12,
                        left: size.height * 0.03,
                        right: size.height * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Overview",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            movie.overview,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CountCard(
                                count: movie.voteCount.toString(),
                              ),
                              CountCard(
                                count: movie.popularity.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 175,
                          width: double.infinity,
                        ),
                        Row(
                          children: <Widget>[
                            // Container(
                            //   margin: EdgeInsets.only(
                            //     left: size.width * 0.05,
                            //   ),
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //       fit: BoxFit.cover,
                            //       image: NetworkImage(
                            //           "https://image.tmdb.org/t/p/w185" +
                            //               movie.poster),
                            //     ),
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   width: 150,
                            //   height: 200,
                            // ),
                            Container(
                              margin: EdgeInsets.only(
                                left: size.width * 0.05,
                              ),
                              child: Hero(
                                tag: 'animateimage${movie.poster}',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: FadeInImage(
                                    width: 150.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                    placeholder:
                                        AssetImage('assets/placeholder.jpg'),
                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w185" +
                                          movie.poster,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                height: 200,
                                child: Align(
                                  alignment: Alignment(-1, 0.75),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: movie.title + '\n',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: movie.releaseDate + '\n',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: Rating(
                                            rating: movie.voteAverage,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
