import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:mycity/const/const.dart';
import 'package:mycity/models/meteology_model.dart';

class MeteologyControls {
  String location = 'Ankara';
  double? tempureture;
  final String key = '87d43b7c87a34b6bb94d2063a21f5da5';
  String code = 'c';
  var locationData;

  String? icon;
  var forcastData;
  var forcastDataParsed;


  List<double> temputeres = [
    20.15,
    20.18,
    20.15,
    19.00,
    18.25,
  ];


  Future<void> getLocationDataFromAPI() async {
    // print('********************************');
    locationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$key&units=metric'));
    final locatinDataParsed = jsonDecode(locationData.body);
    //print('$locatinDataParsed');

    tempureture = locatinDataParsed['main']['temp'];
    location = locatinDataParsed['name'];
    //code = locatinDataParsed['weather'].first['main'];    buda olur aşşağıda yazdığım da olur
    code = locatinDataParsed['weather'][0]['main'];
    // print('******');
    //print('$code');
    //print('şehir : $location - temputer: $tempureture');
    //print('//////////////////////////////////////////');
    icon = locatinDataParsed['weather'][0]['icon'];
  }

  Future<MeteologyModel> getLocationDataFromAPIByLatLon(
      BuildContext context) async {
    MeteologyModel metModel =
        MeteologyModel(icon: '', code: '', lacation: '', tempureture: 0.0);
    Position devicePosition;
    try {
      devicePosition=await _determinePosition();
      locationData = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${devicePosition.latitude}&lon=${devicePosition.longitude}&appid=$key&units=metric'));
      final locatinDataParsed = jsonDecode(locationData.body);

      tempureture = locatinDataParsed['main']['temp'];
      location = locatinDataParsed['name'];
      code = locatinDataParsed['weather'][0]['main'];
      icon = locatinDataParsed['weather'][0]['icon'];

      metModel = MeteologyModel(
          icon: icon!,
          code: code,
          lacation: location,
          tempureture: tempureture!);
      /*print('controoolsss');
      print(metModel.tempureture.toString());
      print(metModel.code);
      print(metModel.lacation);*/

    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString(), Colors.red);
      }
    }
    return metModel;
  }

/*  Future<Position> getDeviceLocation(BuildContext context) async {
    Position devicePosition;
    try {
      devicePosition = await _determinePosition();
    } catch (error) {
      if(context.mounted){
        showSnackBar(context, error.toString(), Colors.red);
      }
    }
    return devicePosition;
    //print('$devicePosition');
  }*/

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition();
  }

  Future<void> getDailyForecastbyLatLon() async {
    Position devicePosition; //try eklenmesi gerekiyor
    devicePosition=await _determinePosition();
    forcastData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${devicePosition!.latitude}&lon=${devicePosition!.longitude}&appid=$key&units=metric'));
    forcastDataParsed = jsonDecode(forcastData.body);
    temputeres.clear();
    icons.clear();
    dates.clear();

    for (int i = 7; i < 40; i = i + 8) {
      temputeres.add(forcastDataParsed['list'][i]['main']['temp']);
      icons.add(forcastDataParsed['list'][i]['weather'][0]['icon']);
      dates.add(forcastDataParsed['list'][i]['dt_txt']);
    }
  }

  Future<void> getDailyForcestbyLocation() async {
    forcastData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$key&units=metric'));
    forcastDataParsed = jsonDecode(forcastData.body);
    temputeres.clear();
    icons.clear();
    dates.clear();

    for (int i = 7; i < 40; i = i + 8) {
      temputeres.add(forcastDataParsed['list'][i]['main']['temp']);
      icons.add(forcastDataParsed['list'][i]['weather'][0]['icon']);
      dates.add(forcastDataParsed['list'][i]['dt_txt']);
    }
  }

 /* void getInitialData() async {
    await getDeviceLocation();
    await getLocationDataFromAPIByLatLon(); //curent wather data
    await getDailyForecastbyLatLon(); //forcest by 5days
  }*/
}
