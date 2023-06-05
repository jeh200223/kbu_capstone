import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/DatasBorder.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/network.dart';

class TemperatureSc_F extends StatefulWidget {
  const TemperatureSc_F ({Key? key}) : super (key: key);

  @override
  State<TemperatureSc_F> createState() => _Temperature_upState();
}

class _Temperature_upState extends State<TemperatureSc_F> {
  String? hum;
  String? water_level;

  @override
  void initState() {
    super.initState();
    getdatas();
  }

  void getdatas() async {
    var weatherdata = await Networksenddata().getalldata('farm', 'data');
    hum = weatherdata['value2'];
    water_level = weatherdata['value4'];
    print(weatherdata);
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
          DatasBorder(title: '습도', textV: '${hum.toString().substring(0,2)}%', icon: Icon(CupertinoIcons.drop,
          color: kPrimaryColor, size: 50)),
          DatasBorder(title: '수위', textV: '${water_level.toString()}', icon: Icon(Icons.opacity,
          color: kPrimaryColor, size: 50)),
        ],
      ),
    );
  }
}