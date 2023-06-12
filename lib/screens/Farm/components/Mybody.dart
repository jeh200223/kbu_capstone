import 'package:flutter/cupertino.dart';
import 'package:untitled/components/TemperatureF.dart';
import 'package:untitled/components/TemperatureSc_F.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/screens/Farm/components/controllersf.dart';
import 'package:untitled/screens/Farm/components/farmcontroller.dart';

class Mybody extends StatefulWidget {
  const Mybody ({Key ? key}) : super (key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody>{
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: kPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenWidth < 900 ? 20 : 80),
                    Temperature_up_F(),
                    SizedBox(height: 30),
                    TemperatureSc_F(),
                    SizedBox(height: 30),
                    Controllersf(),
                    screenWidth < 900 ? Farmcontroller() : Container()
                  ],
                ),
              ),
            ),
          screenWidth < 900 ?
              Container() :
              Expanded(
                  flex: 1,
                  child: Farmcontroller()
              ),
        ],
      ),
    );
  }
}