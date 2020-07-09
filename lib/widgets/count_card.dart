import 'package:flutter/material.dart';

class CountCard extends StatelessWidget {
  final String count;
  CountCard({this.count});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: size.width * 0.3,
        height: size.height * 0.1,
        child: Column(
          children: <Widget>[
            Text(
              '$count',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'vote count',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
