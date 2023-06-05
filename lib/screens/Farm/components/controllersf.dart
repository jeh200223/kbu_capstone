import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/ContollerWidget.dart';
import 'package:untitled/components/CustomSwitch.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/network.dart';

class Controllersf extends StatefulWidget {
  const Controllersf ({Key? key}) : super (key: key);

  @override
  State<Controllersf> createState() => _ControllersfState();
}

class _ControllersfState extends State<Controllersf> {
  bool? _checked_led;
  bool? _checked_fan;
  bool? _checked_water;
  int? led, fan, water;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    var weatherdata = await Networksenddata().getalldata('farm', 'io');
    led = weatherdata['value1'];
    fan = weatherdata['value2'];
    water = weatherdata['value3'];
    _checked_led = led == 1;
    _checked_fan = fan == 1;
    _checked_water = water == 1;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
      ),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContollerWidget(icon: Icon(CupertinoIcons.lightbulb, color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70), text: '조명', widget: CustomSwitch(
                initialValue: _checked_led!, onChanged: (value) {
                  _checked_led = value;
                  Insert networking = Insert();
                  networking.insertdata('io', 'farm', _checked_led!, _checked_fan!, _checked_water!);
            },
            ),),
            SizedBox(width: 20),
            ContollerWidget(icon: Icon(Icons.ac_unit, color: kPrimaryColor, size: screenWidth < 900 ? 40: 70), text: '팬', widget: CustomSwitch(
                initialValue: _checked_fan!, onChanged: (value) {
                  _checked_fan = value;
                  Insert networking = Insert();
                  networking.insertdata('io', 'farm', _checked_led!, _checked_fan!, _checked_water!);
            },
            ),
            ),
            SizedBox(width: 20),
            ContollerWidget(icon: Icon(Icons.format_color_fill, color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70), text: '물 공급', widget: CustomSwitch(
                initialValue: _checked_water!, onChanged: (value) {
                  _checked_water = value;
                  Insert networking = Insert();
                  networking.insertdata('io', 'farm', _checked_led!, _checked_fan!, _checked_water!);
            },
            ),
            ),
          ],
        ),
      ),
    );
  }
}