import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_questions/screens/home.dart';
import 'package:flutter_questions/utils/custom-images.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    loadData();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  CustomImages.logo,
                  width: animation.value * 200,
                  height: animation.value * 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
