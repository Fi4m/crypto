import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/currency_list_bloc.dart';
import 'package:crypto_currency/app/presentation/widgets/currency_detail_sheet.dart';
import 'package:crypto_currency/app/presentation/widgets/currency_inherited_widget.dart';
import 'package:crypto_currency/app/presentation/widgets/currency_list_view.dart';
import 'package:crypto_currency/app/presentation/widgets/currency_tabbed_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum _ViewType { listView, tabbedView, searchView }

class CurrencyListScreen extends StatefulWidget {
  final CurrencyListBloc _bloc;

  CurrencyListScreen(this._bloc);

  @override
  _CurrencyListScreenState createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController textEditingController = TextEditingController();
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
        case _ViewType.searchView:
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    this.widget._bloc.init();
    this.widget._bloc.fetchMarketDetails();
    
    textEditingController.addListener(() {
      widget._bloc.searchTextDidChange(textEditingController.text);
    });
    this.widget._bloc.filteredCurrencies.listen((currences) {
      _tabController = TabController(
        initialIndex: 0,
        length: widget._bloc.marketDetails.markets.length,
        vsync: this,
      );
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
        marketDetails: widget._bloc.marketDetails,
        onCurrencyListElementTap: (entity) => _showCurrencyDetails(entity),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF141A2F),
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              title: _titleView,
              leading: _leftBarButtonItem,
              actions: _rightBarButtonItems,
              bottom: this._viewType == _ViewType.tabbedView
                  ? CurrencyTabBar()
                  : null,
            ),
            body: Container(
              color: Color(0xFF0D111B),
              child: StreamBuilder(
                stream: this.widget._bloc.filteredCurrencies,
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
                    switch (this._viewType) {
                      case _ViewType.tabbedView:
                        return CurrencyTabbedListView();
                      default:
                        return CurrencyListView(
                          snapshot.data,
                          onTap: (entity) => _showCurrencyDetails(entity),
                        );
                    }
                  }
                },
              ),
            )));
  }

  Widget get _titleView => this._viewType == _ViewType.searchView
      ? TextField(
          controller: textEditingController,
          cursorColor: Colors.white,
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search here",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          ),
        )
      : Text(
          "MARKETS",
          style: TextStyle(color: Colors.white, fontSize: 17),
        );

  Widget get _leftBarButtonItem => this._viewType != _ViewType.searchView
      ? IconButton(
          icon: SvgPicture.asset(this._viewType == _ViewType.tabbedView
              ? Images.icList
              : Images.icTabbed),
          onPressed: () => this._toggleView(),
        )
      : null;

  List<Widget> get _rightBarButtonItems => [
        IconButton(
          icon: Icon(
              this._viewType == _ViewType.searchView
                  ? Icons.close
                  : Icons.search,
              color: Colors.white),
          onPressed: () => this.setState(() {
            if (this._viewType == _ViewType.searchView)
              this._viewType = _ViewType.listView;
            else
              this._viewType = _ViewType.searchView;
          }),
        )
      ];

  void _showCurrencyDetails(CurrencyEntity entity) {
    showModalBottomSheet(
        context: context, builder: (_) => CurrencyDetailSheet(entity));
  }
}
