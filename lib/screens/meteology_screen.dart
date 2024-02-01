import 'package:flutter/material.dart';
import 'package:mycity/controls/meteorogy_controls.dart';
import 'package:mycity/models/meteology_model.dart';

import '../const/const.dart';

class MeteologyScreen extends StatefulWidget {
  const MeteologyScreen({Key? key}) : super(key: key);

  @override
  State<MeteologyScreen> createState() => _MeteologyScreenState();
}

class _MeteologyScreenState extends State<MeteologyScreen> {
  late MeteologyModel metModel;

  @override
  void initState() {
    getTempByLocation();
    super.initState();
  }

  getTempByLocation() async {
    lottieProgressDialog(context,'assets/json/progress_wather.json');
    metModel =
        await MeteologyControls().getLocationDataFromAPIByLatLon(context);
    print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
    print(metModel.tempureture.toString());
    print(metModel.code);
    print(metModel.lacation);
    if(context.mounted){
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
