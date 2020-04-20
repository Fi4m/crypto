import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/home/currency_list_bloc.dart';
import 'package:crypto_currency/app/presentation/home/widgets/currency_detail_sheet.dart';
import 'package:crypto_currency/app/presentation/home/widgets/currency_inherited_widget.dart';
import 'package:crypto_currency/app/presentation/home/widgets/currency_list_view.dart';
import 'package:crypto_currency/app/presentation/home/widgets/currency_tabbed_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum _ViewType { listView, tabbedView }

class CurrencyListScreen extends StatefulWidget {
  final CurrencyListBloc _bloc;

  CurrencyListScreen(this._bloc);

  @override
  _CurrencyListScreenState createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  _ViewType _viewType = _ViewType.listView;

  _toggleView() {
    this.setState(() {
      switch (this._viewType) {
        case _ViewType.listView:
          this._viewType = _ViewType.tabbedView;
          break;
        case _ViewType.tabbedView:
          this._viewType = _ViewType.listView;
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    this.widget._bloc.init();
    this.widget._bloc.fetchMarketDetails();
    this.widget._bloc.marketDetails.listen((marketDetails) {
      _tabController = TabController(
          initialIndex: 0,
          length: marketDetails.markets.length,
          vsync: this,);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    this.widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CurrencyInheritedWidget(
        tabController: _tabController,
        marketDetails: widget._bloc.marketDetails.value,
        onCurrencyListElementTap: (entity) => _showCurrencyDetails(entity),
        child: Scaffold(
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
                  icon: SvgPicture.asset(this._viewType == _ViewType.tabbedView
                      ? Images.icList
                      : Images.icTabbed),
                  onPressed: () => this._toggleView(),
                )
              ],
              bottom: this._viewType == _ViewType.tabbedView
                  ? CurrencyTabBar()
                  : null,
            ),
            body: Container(
              color: Color(0xFF0D111B),
              child: StreamBuilder(
                stream: this.widget._bloc.marketDetails,
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
                    switch (this._viewType) {
                      case _ViewType.listView:
                        return CurrencyListView(marketDetails.entities,
                        onTap: (entity) => _showCurrencyDetails(entity),
                        );
                      case _ViewType.tabbedView:
                        return CurrencyTabbedListView();
                    }
                  }

                  return Container();
                },
              ),
            )));
  }

  void _showCurrencyDetails(CurrencyEntity entity) {
    showModalBottomSheet(context: context, builder: (_) => CurrencyDetailSheet(entity));
  }
}
