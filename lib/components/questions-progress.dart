import 'package:flutter/material.dart';
import 'package:flutter_questions/components/line-separator.dart';

class Progress extends StatelessWidget {
  Progress({this.actual, this.total, this.keyElement});

  final int actual;
  final int total;
  final String keyElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyElement),
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Question $actual',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9199C3),
                ),
              ),
              Text(
                '/$total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF9199C3),
                ),
              ),
            ],
          ),
          LineSeparator(),
        ],
      ),
    );
  }
}
