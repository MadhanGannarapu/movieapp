import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 75,
          ),
          Image.asset('assets/nodatafound.png'),
          Column(
            children: <Widget>[
              Text(
                'Oops!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'No data found',
                style: TextStyle(
                  color: Colors.black54,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
