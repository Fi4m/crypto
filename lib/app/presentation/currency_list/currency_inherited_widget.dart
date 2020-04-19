

import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:flutter/material.dart';

class CurrencyInheritedWidget extends InheritedWidget {
  final TabController tabController;
  final MarketDetailsEntity marketDetails;

  CurrencyInheritedWidget({
    this.tabController,
    this.marketDetails,
    Widget child,
  }) : super (
    child: child
  );

  static CurrencyInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CurrencyInheritedWidget>();
  
  @override
  bool updateShouldNotify(_) => true;
}