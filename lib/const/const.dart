import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mycity/screens/home_screens.dart';

List<Widget> screenList = [
  const HomeScreen(),
  const Center(child: Text('Sos'),),
  const Center(child: Text('Attractions'),)
];
showSnackBar(BuildContext context, String txt, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        txt,
      ),
      backgroundColor: color,
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}

List<String> dates = [
  "Sali",
  "Çarşamba",
  "Perşembe",
  "Cuma",
  "Cumartesi",
  "Pazar",
];
List<String> icons = [
  "02n",
  "02n",
  "02n",
  "02n",
  "02n",
];

//dialog
void lottieProgressDialog(BuildContext context, String url) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width / 2.2,
          height: MediaQuery
              .of(context)
              .size
              .width / 2.2,
          child: Lottie.asset(url),
        ),
      );
    },
  );
}