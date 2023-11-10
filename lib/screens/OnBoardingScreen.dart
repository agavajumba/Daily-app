import 'package:dailyapp/screens/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dailyapp/models/SlideBoardingScreen.dart';
import 'package:dailyapp/themes/OnBoardingStyle.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreen createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  // creating all the widget before making our home screeen

  int _currentPage = 0;
  List<SlideBoardingScreen> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      SlideBoardingScreen(
          "assets/images/onboarding/screen-1.png",
          "Manage all your daily activities",
          "DailyApp is an app to manage your daily activies with simplify features"),
      SlideBoardingScreen(
          "assets/images/onboarding/screen-2.png",
          "Notify and schedule your activities",
          "DailyApp will notify all your unfinished task so you will not forget to do."),
      SlideBoardingScreen(
          "assets/images/onboarding/screen-3.png",
          "You are scheduled now! it's time to be productive",
          "DailyApp will make your daily activities to be a productive and efficient."),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  // building single slide

  Widget _buildSlide(SlideBoardingScreen slide) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(32),
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            children: [
              Text(
                slide.heading,
                style: onBoardingTitleStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                slide.description,
                style: onBoardingDescriptionStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
        )
      ],
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 12,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 8 : 5,
      height: index == _currentPage ? 8 : 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? Colors.greenAccent
              : Color.fromRGBO(206, 209, 223, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: 32,
                ),
                _currentPage == _slides.length - 1
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()),
                          );
                        },
                        child: Text('Get Started'),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(11, 189, 109, 1),
                            minimumSize: Size(300, 35)),
                      )
                    : Text(''),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
