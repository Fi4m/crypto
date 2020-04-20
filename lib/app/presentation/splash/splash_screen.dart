import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Image.asset("assets/images/img_coindcx.png"),
      ));
}
