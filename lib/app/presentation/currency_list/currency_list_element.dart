import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:flutter/material.dart';

class CurrencyListElement extends StatelessWidget {
  CurrencyEntity entity;

  CurrencyListElement(this.entity);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(entity.targetCurrencyName);
  }
}
