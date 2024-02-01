import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:mycity/screens/home_screens.dart';
import 'package:mycity/screens/meteology_screen.dart';
import 'package:mycity/screens/navigator.dart';

void main() {
  //initializeDateFormatting('tr_TR','' );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My City',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  //NavigatorScreen()
      const MeteologyScreen()
    );
  }
}
