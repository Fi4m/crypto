import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/currency_list/currency_list_bloc.dart';
import 'package:crypto_currency/app/presentation/currency_list/currency_list_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      _tabController = TabController(
          vsync: this,
          length: marketDetails.markets.length,
          initialIndex: _selectedIndex);
          this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> markets =
        List.from(this.widget._bloc.marketDetails.value != null ? this.widget._bloc.marketDetails.value.markets.keys : []);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF141A2F),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "MARKETS",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(Images.icFilter),
              // onPressed: () => Navigator.pop(context),
            )
          ],
          bottom: markets.length > 0 ? _createTabBar(markets) : null,
        ),
        body: Container(
          color: Color(0xFF0D111B),
          child: StreamBuilder(
            stream: this.widget._bloc.filteredResults,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }

              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white)));
              } else {
                MarketDetailsEntity marketDetails = snapshot.data;
                return _createTabView(marketDetails.markets);
              }
            },
          ),
        ));
  }

  Widget _createTabBar(List<String> markets) => TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorWeight: 0,
            indicator: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Images.tabBarBackground))),
            tabs: markets.map((market) => Tab(text: market)).toList(),
          );

  Widget _createTabView(Map<String, List<CurrencyEntity>> markets) {
    List<String> keys = List.from(markets.keys);

    return TabBarView(
      controller: _tabController,
      children: List.from(keys.map((key) => _createListView(markets[key]))),
    );
  }

  Widget _createListView(List<CurrencyEntity> currencies) {
    return ListView.separated(
        itemCount: currencies.length,
        separatorBuilder: (_, index) => Divider(color: Color(0xFF555555).withOpacity(0.5)),
        itemBuilder: (_, index) => CurrencyListElement(
              currency: currencies[index],
              onTap: () {},
            ));
  }
}
