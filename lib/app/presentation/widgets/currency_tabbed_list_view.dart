import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/widgets/currency_inherited_widget.dart';
import 'package:crypto_currency/app/presentation/widgets/currency_list_view.dart';
import 'package:flutter/material.dart';

class CurrencyTabBar extends StatelessWidget implements PreferredSizeWidget {

  Size get preferredSize {
    return Size(double.infinity, 46);
  }

  @override
  Widget build(BuildContext context) {

    Map<String, List<CurrencyEntity>> markets = CurrencyInheritedWidget.of(context).marketDetails.markets;
    List<String> marketNames = List.from(markets.keys);

    return TabBar(
        controller: CurrencyInheritedWidget.of(context).tabController,
        isScrollable: true,
        indicatorWeight: 0,
        indicator: BoxDecoration(
            image: DecorationImage(image: AssetImage(Images.tabBarBackground))),
        tabs: marketNames.map((market) => Tab(text: market)).toList(),
      );
  }
}

class CurrencyTabbedListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Map<String, List<CurrencyEntity>> markets = CurrencyInheritedWidget.of(context).marketDetails.markets;
    List<String> marketNames = List.from(markets.keys);

    return TabBarView(
      controller: CurrencyInheritedWidget.of(context).tabController,
      children: marketNames.map((key) => CurrencyListView(
        markets[key],
        onTap: CurrencyInheritedWidget.of(context).onCurrencyListElementTap
        )).toList(), 
    );
  }
}
