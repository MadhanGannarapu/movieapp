import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final double rating;
  Rating({this.rating});
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 15,
      itemCount: 10,
      maxRating: 10,
      allowHalfRating: true,
      initialRating: rating,
      direction: Axis.horizontal,
      minRating: 0,
      onRatingUpdate: (_) {},
      unratedColor: Colors.amber.withAlpha(50),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}
