import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderHomePageWidget extends StatefulWidget {
  const SliderHomePageWidget({Key? key}) : super(key: key);

  @override
  State<SliderHomePageWidget> createState() => _SliderHomePageWidgetState();
}

class _SliderHomePageWidgetState extends State<SliderHomePageWidget> {
  List imageList = [
    {"id": 1, "image_path": 'https://firebasestorage.googleapis.com/v0/b/planla.appspot.com/o/proje%20resimleri%2Fos1.png?alt=media&token=1db844f0-0cd7-42ec-b1e6-2ed7739d20fa'},
    /*{"id": 2, "image_path": 'assets/images/butcele_4.png'},*/
    {"id": 2, "image_path": 'https://firebasestorage.googleapis.com/v0/b/planla.appspot.com/o/proje%20resimleri%2Fos2.png?alt=media&token=074d3174-e665-4869-a548-a981d9e65687'},
    {"id": 3, "image_path": 'https://firebasestorage.googleapis.com/v0/b/planla.appspot.com/o/proje%20resimleri%2Fos3.png?alt=media&token=f175b0f1-35e5-4048-b9d6-3cd3d8049dc3'}

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
                    .map((item) => Image.network(
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
