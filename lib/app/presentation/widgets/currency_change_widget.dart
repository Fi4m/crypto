import 'dart:math';

import 'package:flutter/material.dart';

class CurrencyChangeWidget extends StatelessWidget {
  final double change24hour;
  final double alphaHelperDivisor = 5;

  CurrencyChangeWidget(this.change24hour);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 28,
      decoration: BoxDecoration(
          color: change24hour < 0 ? Colors.red.withAlpha(_alpha) : Colors.green.withAlpha(_alpha),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Center(
        child: Text(change24hour < 0 ? "$change24hour%" : "+$change24hour%",
            style: TextStyle(color: Colors.white, fontSize: 12)),
      ),
    );
  }

  int get _alpha {
    double ratio = change24hour.abs()/alphaHelperDivisor;
    return min(32 + (224*ratio).toInt(), 255);
  }
}
