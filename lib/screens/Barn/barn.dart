import 'package:flutter/material.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/screens/Barn/components/MyBody.dart';
import 'package:untitled/screens/Barn/components/MyHeader.dart';

class Barn extends StatefulWidget {
  const Barn ({Key ? key}) : super (key: key);

  @override
  State<Barn> createState() => _BarnState();
}

class _BarnState extends State<Barn>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: kPrimaryColor,
          child: ListView(
            children: [
              SizedBox(height: 10),
              Myheader(),
              SizedBox(height: 10),
              Mybody()
            ],
          ),
        ),
      ),
    );
  }
}