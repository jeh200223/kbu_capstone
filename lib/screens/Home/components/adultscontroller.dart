import 'package:flutter/material.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/screens/Home/components/adultControllerState.dart';
import 'package:untitled/screens/Home/components/adultControllerheader.dart';

class adultscontroller extends StatefulWidget {
  const adultscontroller ({Key? key}) : super (key: key);

  @override
  State<adultscontroller> createState() => _adultscontrollerState();
}

class _adultscontrollerState extends State<adultscontroller> {

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: screenWidth > 900 ? EdgeInsets.only(right: 20, left: 20) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: kbgcolor
      ),
      child: Column(
        children: [
          adultControllerheader(),
          adultControllerState()
        ],
      ),
    );
  }
}