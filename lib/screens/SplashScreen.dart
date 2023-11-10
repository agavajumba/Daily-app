import 'package:dailyapp/screens/HomeScreen.dart';
import 'package:dailyapp/screens/OnBoardingScreen.dart';
import 'package:dailyapp/themes/SplashScreenStyle.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dailyapp/utils/PrefManager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  bool displayOnBoardingScreen = true;
  void initState() {
    super.initState();
    startSplashScreen();
    PrefManager()
        .getOnBoardingScreen()
        .then((value) => displayOnBoardingScreen = value);
  }

  startSplashScreen() async {
    const duration = Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (displayOnBoardingScreen ? OnBoardingScreen() : HomeScreen())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.timer_rounded,
              size: 100.0,
              color: Color.fromRGBO(11, 189, 109, 1),
            ),
            SizedBox(height: 24.0),
            Text(
              "DailyApp",
              style: splashScreenTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
