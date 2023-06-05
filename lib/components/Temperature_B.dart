import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/DatasBorder.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/network.dart';

class Temperature_up_B extends StatefulWidget {
  const Temperature_up_B ({Key ? key}) : super (key: key);

  @override
  State<Temperature_up_B> createState() => _Temperature_upState();
}

class _Temperature_upState extends State<Temperature_up_B> {
  String? temp;
  String? food;

  @override
  void initState() {
    super.initState();
    getdatas();
  }

  void getdatas() async {
    var weatherdata = await Networksenddata().getalldata('barn', 'data');
    temp = weatherdata['value1'];
    food = weatherdata['value3'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(
          color: Colors.black, width: 1, style: BorderStyle.solid)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DatasBorder(title: '온도',
              textV: '${temp.toString().substring(0, 2)}°C',
              icon: Icon(CupertinoIcons.thermometer,
              color: kPrimaryColor, size: 50)),
          DatasBorder(title: '사료',
              textV: food.toString(),
              icon: Icon(Icons.food_bank_outlined,
                  color: kPrimaryColor, size: 50)),
        ],
      ),
    );
  }
}