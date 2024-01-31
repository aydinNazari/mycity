import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEEEE),
        title: Container(
            width: size.width,
            height: size.height / 15,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(size.width/25))
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:size.width/45),
                  child: Icon(
                    Icons.menu,
                    color: Colors.blue,
                    size: size.width / 12,
                  ),
                ),
                const Spacer(),
                Text(
                  'MyCity',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
              ],
            )),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
