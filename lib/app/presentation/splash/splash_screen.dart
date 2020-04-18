import 'package:crypto_currency/app/presentation/splash/splash_bloc.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final SplashBloc _bloc = SplashBloc();

  // SplashScreen(this._bloc);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    this.widget._bloc.init();
    this.widget._bloc.timeoutListener.listen((_) {
      Navigator.pushNamedAndRemoveUntil(context, "/list", (_) => false);
    });
  }

  @override
  void dispose() {
    this.widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Welcome to", style: TextStyle(fontSize: 30)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Image.asset("assets/images/img_coindcx.png"),
          ),
          Text("Markets", style: TextStyle(fontSize: 24))
        ],
      ),
    ));
  }
}
