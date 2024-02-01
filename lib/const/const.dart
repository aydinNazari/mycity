import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mycity/screens/home_screens.dart';

List<Widget> screenList = [
  const HomeScreen(),
  const Center(
    child: Text('Sos'),
  ),
  const Center(
    child: Text('Attractions'),
  )
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

String haftaninGunu(DateTime tarih) {
  print(tarih);
  int haftaninGunuIndex = tarih.weekday;
  switch (haftaninGunuIndex) {
    case 1:
      return "Pazar";
    case 2:
      return "Pazartesi";
    case 3:
      return "Salı";
    case 4:
      return "Çarşamba";
    case 5:
      return "Perşembe";
    case 6:
      return "Cuma";
    case 7:
      return "Cumartesi";
    default:
      return "Bilinmeyen Gün";
  }
}

//dialog
void lottieProgressDialog(BuildContext context, String url) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2.2,
          height: MediaQuery.of(context).size.width / 2.2,
          child: Lottie.asset(url),
        ),
      );
    },
  );
}
