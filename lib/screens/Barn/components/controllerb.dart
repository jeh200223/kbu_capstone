import 'package:flutter/material.dart';
import 'package:untitled/components/ContollerWidget.dart';
import 'package:untitled/components/CustomSwitch.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/network.dart';

class Controllerb extends StatefulWidget {
  const Controllerb ({Key ? key}) : super (key: key);

  @override
  State<Controllerb> createState() => _ControllerbState();
}

class _ControllerbState extends State<Controllerb> {
  bool? _checked_fan;
  bool? _checked_water;
  bool? _checked_food;
  int? fan, water, food;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    var weatherdata = await Networksenddata().getalldata('barn', 'io');
    fan = weatherdata['value1'];
    water = weatherdata['value2'];
    food = weatherdata['value3'];
    _checked_water = water == 1;
    _checked_fan = fan == 1;
    _checked_food = food == 1;
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
                icon: Icon(Icons.ac_unit,
                color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                text: '팬',
                widget: CustomSwitch(
                    initialValue: _checked_fan!,
                    onChanged: (value) {
                      _checked_fan = value;
                      Insert networking = Insert();
                      networking.insertdata('io', 'barn', _checked_fan!, _checked_water!, _checked_food!);
                    },
                )),
            SizedBox(width: 20),
            ContollerWidget(icon: Icon(Icons.format_color_fill,
              color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                text: '물 공급',
                widget: CustomSwitch(initialValue: _checked_water!,
                    onChanged: (value) {
                      _checked_water = value;
                      Insert networking = Insert();
                      networking.insertdata('io', 'barn', _checked_fan!, _checked_water!, _checked_food!);
                    },
                )),
            SizedBox(width: 20),
            ContollerWidget(
              text: '사료공급',
              icon: Icon(Icons.touch_app,
                  color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
              widget: CustomSwitch(
                initialValue: _checked_food!,
                onChanged: (value) {
                  _checked_food = value;
                  Insert networking = Insert();
                  networking.insertdata('io', 'barn', _checked_fan!,
                      _checked_water!, _checked_food!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}