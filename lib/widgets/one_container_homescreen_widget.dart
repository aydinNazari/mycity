
import 'package:flutter/material.dart';

import '../const/color.dart';

class OneContainerHomeScreenWidget extends StatelessWidget {
  const OneContainerHomeScreenWidget({
    super.key,
    required this.size, required this.rightLeftControl,
  });

  final Size size;
  final bool rightLeftControl;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}