import 'package:flutter/material.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/screens/Home/components/Mybody.dart';
import 'package:untitled/screens/Home/components/Myheader.dart';

class Home extends StatefulWidget {
  const Home ({Key? key}) : super (key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: kSecondaryColor,
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