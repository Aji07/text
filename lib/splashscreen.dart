import 'dart:async';
import 'package:flutter/material.dart';
import 'package:text/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home()))
    );
    return Scaffold(
      body: Container(
        width: double.infinity,height: double.infinity,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("image/back.jpg"),
                fit: BoxFit.fill,
              )
          )
      ),
    );
  }
}
