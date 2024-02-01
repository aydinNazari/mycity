import 'package:flutter/material.dart';
import 'package:mycity/const/color.dart';
import 'package:mycity/screens/meteology_screen.dart';
import 'package:mycity/widgets/slider_homepage_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: scafoldColor,
        title: Container(
            width: size.width,
            height: size.height / 15,
            decoration: BoxDecoration(
                color: appbarColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width / 25))),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width / 45),
                  child: Icon(
                    Icons.menu,
                    color: textColor,
                    size: size.width / 12,
                  ),
                ),
                const Spacer(),
                Text(
                  'MyCity',
                  style: TextStyle(
                      color: textColor,
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height / 80, horizontal: size.width / 25),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(size.width / 25),
                ),
                child: const SliderHomePageWidget(),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height / 80, horizontal: size.width / 25),
                  child: Container(
                    width: size.width,
                    height: size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(size.width / 25)),
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    width: size.width / 2.2,
                    height: size.height / 5,
                    child: Image.asset('assets/images/girl_work.png'),
                  ),
                ),
                Positioned(
                  top: size.height / 20,
                  left: size.width / 10,
                  child: SizedBox(
                    width: size.width / 2.2,
                    height: size.height / 5,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Direct registration of urban problems (153)',
                      softWrap: true,
                      style: TextStyle(
                          fontSize: size.width / 20,
                          color: textColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width / 25, right: size.width / 25),
              child: Row(
                children: [
                  buildRowContainers(size, 'Favorite Places',
                      'assets/images/favorite place.png'),
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 25),
                    child: buildRowContainers(
                        size, 'Traffic Events', 'assets/images/traffic.png'),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height / 80, horizontal: size.width / 25),
                  child: Container(
                    width: size.width,
                    height: size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(size.width / 25)),
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  right: size.width / 15,
                  top: size.height / 20,
                  child: SizedBox(
                    width: size.width / 2.2,
                    height: size.height / 5,
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Routing',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: size.width / 15,
                              color: textColor,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: size.width / 2.5,
                          height: size.height / 5,
                          child: Text(
                            textAlign: TextAlign.center,
                            'with Considering Traffic and Limits',
                            softWrap: true,
                            style: TextStyle(
                                fontSize: size.width / 25,
                                color: textColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: size.width / 15,
                  top: size.height / 80,
                  child: SizedBox(
                    width: size.width / 2.5,
                    height: size.height / 5,
                    child: Image.asset('assets/images/routing.png'),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width / 25),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: const MeteologyScreen()));
                    },
                    child: buildRowContainers(
                        size, 'Meteorology', 'assets/images/meteorology.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 25),
                    child: buildRowContainers(size, 'Location Service',
                        'assets/images/location_sevice.png'),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height / 80, horizontal: size.width / 25),
                  child: Container(
                    width: size.width,
                    height: size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(size.width / 25)),
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    width: size.width / 2.2,
                    height: size.height / 5,
                    child: Image.asset('assets/images/girl_work.png'),
                  ),
                ),
                Positioned(
                  top: size.height / 20,
                  left: size.width / 10,
                  child: SizedBox(
                    width: size.width / 2.2,
                    height: size.height / 5,
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Smart',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: size.width / 18,
                              color: textColor,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Transportation',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: size.width / 18,
                              color: textColor,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width / 25),
              child: Row(
                children: [
                  buildRowContainers(size, 'Citizenship Education',
                      'assets/images/education.png'),
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 25),
                    child: buildRowContainers(
                        size, 'Property Imquiry', 'assets/images/property.png'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height / 8,
            )
          ],
        ),
      ),
    );
  }

  Widget buildRowContainers(Size size, String txt, String imgUrl) {
    return Container(
      width: size.width / 2.3,
      height: size.height / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(size.width / 25),
          ),
          color: homepageContainerColor),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height / 80),
            child: SizedBox(
                width: size.width / 2.9,
                height: size.height / 7,
                child: Image.asset(imgUrl)),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 50),
            child: Text(
              textAlign: TextAlign.center,
              txt,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: size.width / 26),
            ),
          )
        ],
      ),
    );
  }
}
