import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_questions/components/question.dart';
import 'package:flutter_questions/screens/home.dart';
import 'package:flutter_questions/utils/routes-animations.dart';

class Result extends StatelessWidget {
  Result({@required this.total, @required this.score, this.keyElement});

  final int total;
  final int score;
  final String keyElement;

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xFF19D973), Colors.blue],
    ).createShader(
      Rect.fromLTWH(0.0, 0.0, 250.0, 100.0),
    );

    final Visibility _congratsVisibility = Visibility(
      child: Text(
        'Congrats!',
        style: TextStyle(
          foreground: Paint()..shader = linearGradient,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      visible: score > (total * .7),
    );

    return Container(
      key: Key(keyElement),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Question(
            text: 'Finished!\nYou scored $score out of $total.',
            align: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: _congratsVisibility,
          ),
          CustomButton(
            text: 'Play Again',
            onPressed: () => Navigator.push(
              context,
              FadeRoute(page: Home()),
            ),
          ),
        ],
      ),
    );
  }
}
