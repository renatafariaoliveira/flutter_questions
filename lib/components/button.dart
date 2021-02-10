import 'package:flutter/material.dart';
import 'package:flutter_questions/utils/custom-colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.text, this.color, this.onPressed, this.keyElement});

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final String keyElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      height: 50.0,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: FlatButton(
        key: Key(keyElement),
        splashColor: CustomColors.primaryColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: CustomColors.primaryColor,
            width: 2.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: CustomColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
