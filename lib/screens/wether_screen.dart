import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mycity/controls/meteorogy_controls.dart';

import '../const/const.dart';
import '../models/meteology_model.dart';

class WetherScreen extends StatelessWidget {
  const WetherScreen({
    super.key,
    required this.metModel,
    required this.metModelList,
  });

  final MeteologyModel metModel;
  final List<MeteologyModel> metModelList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/wether/${metModel.code}.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: size.height / 4.2,
            left: size.width / 4.3,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: size.width / 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width / 80),
                      child: Text(
                        metModel.lacation,
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: size.width / 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 4,
                      height: size.height / 6,
                      child: Lottie.asset('assets/json/${metModel.code}.json'),
                    ),
                    Text(
                      '${metModel.tempureture}°c',
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: size.width / 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: size.height / 1.8,
            child: SizedBox(
              width: size.width,
              height: size.height / 3.5,
              child: ListView.builder(
                itemCount: metModelList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  print(metModelList[index].date);
                  /* print(sadeceTarih);
                  DateTime tarih = DateTime.parse(sadeceTarih);
                  String day = DateFormat('EEEE', 'tr_TR').format(tarih);*/
                  DateTime date=DateTime.parse(metModelList[index].date);
                  String day=haftaninGunu(date);
                  print('day $day');

                  return Padding(
                    padding: EdgeInsets.only(
                        left: size.width / 65, right: size.width / 65),
                    child: Container(
                      width: size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(size.width / 25),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width / 4,
                              height: size.height / 10,
                              child: Lottie.asset(
                                  'assets/json/${metModelList[index].code}.json'),
                            ),
                            Text(
                              '${metModelList[index].tempureture}°c',
                              style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: size.width / 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              day,
                              style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: size.width / 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
