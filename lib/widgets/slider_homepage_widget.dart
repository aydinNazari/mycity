import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderHomePageWidget extends StatefulWidget {
  const SliderHomePageWidget({Key? key}) : super(key: key);

  @override
  State<SliderHomePageWidget> createState() => _SliderHomePageWidgetState();
}

class _SliderHomePageWidgetState extends State<SliderHomePageWidget> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/os1.png'},
    /*{"id": 2, "image_path": 'assets/images/butcele_4.png'},*/
    {"id": 2, "image_path": 'assets/images/os2.png'},
    {"id": 3, "image_path": 'assets/images/os3.png'}

  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {},
              child: CarouselSlider(
                items: imageList
                    .map((item) => Image.asset(
                  item['image_path'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(
                          () {
                        currentIndex = index;
                      },
                    );
                  },
                ),
              ),
            ),
            /*Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex==entry.key ? 12 : 6,
                        height: 5.0,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          boxShadow: [],
                          borderRadius: BorderRadius.circular(20),
                          color:currentIndex==entry.key? const Color(0xffcbd9dc) : const Color(
                              0xff000000),
                        ),
                      ),
                    );
                  }).toList(),
                )
            )*/
          ],
        ),
      ],
    );
  }
}
