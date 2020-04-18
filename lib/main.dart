import 'package:crypto_currency/di/bloc_injector.dart';
import 'package:crypto_currency/di/crypto_module.dart';
import 'package:flutter/material.dart';

void main() async {
  var container = await BlocInjector.create(
      CryptoModule()
  );

  runApp(container.app);
}