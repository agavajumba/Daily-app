import 'package:dailyapp/screens/AssignmentScreen.dart';
import 'package:dailyapp/screens/HomeScreen.dart';
import 'package:dailyapp/themes/WelcomeScreenStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset('assets/images/layout/layout-1.png')),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset('assets/images/layout/layout-3.png')),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi, What`s Your Name?',
                    style: welcomeScreenTitleStyle,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'John Doe',
                      ),
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(11, 189, 109, 1),
                        minimumSize: Size(300, 35)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
