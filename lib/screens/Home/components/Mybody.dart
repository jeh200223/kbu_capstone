import 'package:flutter/material.dart';
import 'package:untitled/components/Temperature.dart';
import 'package:untitled/components/TemperatureSc.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/screens/Home/components/adultscontroller.dart';
import 'package:untitled/screens/Home/components/controller.dart';

class Mybody extends StatefulWidget {
  const Mybody ({Key? key}) : super(key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody>{

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: kSecondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenWidth < 900 ? 20 : 80),
                    Temperature_up(),
                    SizedBox(
                      height: 30,
                    ),
                    TemperatureSc(),
                    SizedBox(
                      height: 30,
                    ),
                    controller(),
                    SizedBox(height: 20),
                    screenWidth < 900 ? adultscontroller() : Container()
                  ],
                ),
              ),
          ),
          screenWidth < 900 ?
              Container() :
              Expanded(
                flex:1,
                child: adultscontroller(
            ),
          )
        ],
      ),
    );
  }
}