import 'package:crypto_currency/app/presentation/currency_list_bloc.dart';
import 'package:crypto_currency/app/presentation/currency_list_screen.dart';
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
      title: 'CryptoCurrency',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyListScreen(currencyListBloc),
    );
  }
}
