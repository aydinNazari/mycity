import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mycity/controls/meteorogy_controls.dart';
import 'package:mycity/models/meteology_model.dart';
import 'package:mycity/screens/wether_screen.dart';
class MeteologyScreen extends StatefulWidget {
  const MeteologyScreen({Key? key}) : super(key: key);

  @override
  State<MeteologyScreen> createState() => _MeteologyScreenState();
}

class _MeteologyScreenState extends State<MeteologyScreen> {
  late MeteologyModel metModel;
  List<MeteologyModel> metModelList=[];

  @override
  void initState() {
    //lottieProgressDialog(context,'assets/json/progress_wather.json');
    getTempByLocation();
    getDayliLatLon();
    //Navigator.of(context).pop();
    super.initState();
  }

  Future<MeteologyModel>getTempByLocation() async {

    metModel =
        await MeteologyControls().getLocationDataFromAPIByLatLon(context);

    /*print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
    print(metModel.tempureture.toString());
    print(metModel.code);
    print(metModel.lacation);
    print(metModel.icon);
    if(context.mounted){
     // Navigator.of(context).pop();
    }*/
    return metModel;
  }
  Future<List<MeteologyModel>> getDayliLatLon()async{
    metModel=MeteologyModel(icon: '', code: '', lacation: '', tempureture: 0, date: '');
    metModelList=await MeteologyControls().getDailyForecastbyLatLon();
    print('ggggggggggggggggggggggggg');
    print(metModelList.length);
    return metModelList;
  }

  @override
  Widget build(BuildContext context) {
    return /*Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/wether/${metModel.code}.png'), fit: BoxFit.cover),
      ),
    );*/FutureBuilder(
      future: getTempByLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return WetherScreen(metModel: metModel,metModelList: metModelList,);
        } else {
          return const WetherIndicator();
        }
      },
    );
  }
}


class WetherIndicator extends StatelessWidget {
  const WetherIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
            width: size.width/1,
            height: size.height/2,
            child: Lottie.asset('assets/json/progress_wather.json')),
      ),
    );
  }
}
