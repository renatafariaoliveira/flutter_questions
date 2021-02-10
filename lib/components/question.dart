import 'package:flutter/material.dart';
import 'package:flutter_questions/utils/custom-colors.dart';

class Question extends StatelessWidget {
  Question({this.text, this.align, this.keyElement});

  final String text;
  final TextAlign align;
  final String keyElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyElement),
      width: MediaQuery.of(context).size.width * .75,
      margin: EdgeInsets.only(bottom: 50.0),
      child: Text(
        text,
        textAlign: align == null ? TextAlign.left : align,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: CustomColors.primaryColor,
        ),
      ),
    );
  }
}
