import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailyapp/components/AssignmentCard.dart';
import 'package:dailyapp/models/Activities.dart';
import 'package:dailyapp/screens/AssignmentScreen.dart';
import 'package:dailyapp/themes/UserProfileStyle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final _slides = [
  Activities(
      "assets/images/carousel/messy.png", "Pemrograman Web", "08.00 - 10.00"),
  Activities("assets/images/carousel/ballet.png", "Pemrograman Mobile",
      "13.00 - 15.00"),
  Activities(
      "assets/images/carousel/float.png", "UI/UX Design", "15.00 - 17.00"),
];

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/images/layout/layout-1.png')),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        child: Image.asset('assets/images/user/avatar.png'),
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ',
                          style: TextStyle(
                            fontFamily: 'CM Sans Serif',
                            fontSize: 17.0,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Bagaskara',
                          style: userNameStyle,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Activities",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text(
                      '26 July 2021',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'see all',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AssignmentScreen()));
                      },
                      style: TextButton.styleFrom(
                        primary: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: CarouselSlider(
                    items: carouselItem,
                    carouselController: _controller,
                    options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _slides.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 6,
                        height: 6,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Color.fromRGBO(11, 189, 109, 1))
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.2)),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Assignment",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    TextButton(
                      child: Text(
                        'see all',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AssignmentScreen()));
                      },
                      style: TextButton.styleFrom(
                        primary: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (item, index) {
                        return AssignmentCard();
                      }),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

final carouselItem = _slides
    .map((item) => Container(
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(17, 153, 142, 1),
                Color.fromRGBO(56, 239, 125, 1)
              ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  item.image,
                  width: 120,
                  height: 120,
                ),
              ),
              Positioned(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.activity,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        item.time,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ))
    .toList();
