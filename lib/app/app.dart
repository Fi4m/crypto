import 'package:crypto_currency/app/presentation/currency_list/currency_list_bloc.dart';
import 'package:crypto_currency/app/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  final CurrencyListBloc currencyListBloc;

  @provide
  App(
    this.currencyListBloc
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: _routes,
    );
  }

  Map<String, WidgetBuilder> get _routes => {
    '/': (context) => SplashScreen(),
  };
}
