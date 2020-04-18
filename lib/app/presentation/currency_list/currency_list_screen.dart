import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/currency_list/currency_list_bloc.dart';
import 'package:crypto_currency/app/presentation/currency_list/currency_list_element.dart';
import 'package:flutter/material.dart';

class CurrencyListScreen extends StatefulWidget {
  final CurrencyListBloc _bloc;

  CurrencyListScreen(this._bloc);

  @override
  _CurrencyListScreenState createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    
    this.widget._bloc.init();
    this.widget._bloc.fetchMarketDetails();
    this.widget._bloc.marketDetails.listen((marketDetails) {
      _tabController = TabController(vsync: this, length: marketDetails.markets.length, initialIndex: _selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Container(
        // color: Color(0xFF0D111B),
        child: StreamBuilder(
          stream: this.widget._bloc.filteredResults,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            }

            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
            } else {
              MarketDetailsEntity marketDetails = snapshot.data;
              List<CurrencyEntity> currencies = marketDetails.markets["BTC"];
              return ListView.builder(itemCount: currencies.length,itemBuilder: (_, index) => CurrencyListElement(currencies[index]));
            }
          },
        ),
      ),
    ));
  }
}
