

import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:flutter/material.dart';

class CurrencyInheritedWidget extends InheritedWidget {
  final TabController tabController;
  final MarketDetailsEntity marketDetails;
  final void Function(CurrencyEntity) onCurrencyListElementTap;

  CurrencyInheritedWidget({
    this.tabController,
    this.marketDetails,
    this.onCurrencyListElementTap,
    Widget child,
  }) : super (
    child: child
  );

  static CurrencyInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CurrencyInheritedWidget>();
  
  @override
  bool updateShouldNotify(_) => true;
}