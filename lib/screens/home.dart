import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_questions/components/question.dart';
import 'package:flutter_questions/screens/quiz.dart';
import 'package:flutter_questions/utils/custom-images.dart';
import 'package:flutter_questions/utils/custom-questions.dart';
import 'package:flutter_questions/utils/routes-animations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              CustomImages.logo,
              width: 150,
              height: 150,
            ),
            Question(
              text: 'What do we will talk about?',
              align: TextAlign.center,
            ),
            CustomButton(
              text: 'Animals',
              onPressed: () => Navigator.push(
                context,
                FadeRoute(
                  page: Quiz(
                    questionsList: CustomQuestions.animalsQuiz,
                  ),
                ),
              ),
            ),
            CustomButton(
              text: 'Disney',
              onPressed: () => Navigator.push(
                context,
                FadeRoute(
                  page: Quiz(
                    questionsList: CustomQuestions.disneyQuiz,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
