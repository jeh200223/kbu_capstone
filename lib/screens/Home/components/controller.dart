import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/ContollerWidget.dart';
import 'package:untitled/components/CustomSwitch.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/network.dart';

class controller extends StatefulWidget{
  const controller ({Key? key}) : super(key: key);

  @override
  State<controller> createState() => _controllerState();
}

class _controllerState extends State<controller> {
  bool? _checked_led;
  bool? _checked_door;
  int? led, door;

  @override
  void initState() {
    super.initState();
    getdatas();
  }

  void getdatas() async{
    var weatherdata = await Networksenddata().getalldata('home', 'io');
    led = weatherdata['value1'];
    door = weatherdata['value2'];
    _checked_led = led == 1;
    _checked_door = door == 1;
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
            ContollerWidget(
                icon: Icon(CupertinoIcons.lightbulb,
                  color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                text: '조명',
                widget: CustomSwitch(
                    initialValue: _checked_led!,
                    onChanged: (value) {
                      _checked_led = value;
                      Insert networking = Insert();
                      networking.insertdata(
                          'io', 'home', _checked_led!, _checked_door!, false);
                    }
                  ),
                 ),
            SizedBox(width: 20),
            ContollerWidget(icon: Icon(CupertinoIcons.wifi, color: kPrimaryColor, size: screenWidth < 900 ? 40: 70),
                text: '문',
                widget: CustomSwitch(initialValue: _checked_door!, onChanged: (value) {
                  _checked_door = value;
                  Insert networking = Insert();
    networking.insertdata('io', 'home', _checked_led!, _checked_door!, false);
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}