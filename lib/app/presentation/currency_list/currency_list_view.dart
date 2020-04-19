import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/currency_list/currency_list_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum _ListSortState { nameAsc, nameDec, changeAsc, changeDec, none }

class CurrencyListView extends StatefulWidget {
  final List<CurrencyEntity> currencies;

  CurrencyListView(this.currencies);

  @override
  _CurrencyListViewState createState() => _CurrencyListViewState();
}

class _CurrencyListViewState extends State<CurrencyListView> {
  _ListSortState _sortState = _ListSortState.none;

  List<CurrencyEntity> get _sortCurrencies {
    //widget.currencies
    List<CurrencyEntity> currencies = widget.currencies;
    switch (this._sortState) {
      case _ListSortState.none:
        return currencies;
      case _ListSortState.nameAsc:
        widget.currencies.sort(($0, $1) {
          return $0.name.toLowerCase().compareTo($1.name.toLowerCase());
        });
        return currencies;
      case _ListSortState.nameDec:
        widget.currencies.sort(($0, $1) {
          return $0.name.toLowerCase().compareTo($1.name.toLowerCase());
        });
        return currencies.reversed.toList();
      case _ListSortState.changeAsc:
        widget.currencies.sort(($0, $1) {
          return $0.change24hour.compareTo($1.change24hour);
        });
        return currencies;
      case _ListSortState.changeDec:
        widget.currencies.sort(($0, $1) {
          return $0.change24hour.compareTo($1.change24hour);
        });
        return currencies.reversed.toList();
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _ListSortButton(
                      title: "COIN NAME",
                      onPressed: () => this.setState(() {
                            switch (this._sortState) {
                              case _ListSortState.nameAsc:
                                this._sortState = _ListSortState.nameDec;
                                break;
                              default:
                                this._sortState = _ListSortState.nameAsc;
                                break;
                            }
                          }),
                          sortType: (() {
                            switch (this._sortState) {
                              case _ListSortState.nameAsc: return _ListSortType.asc;
                              case _ListSortState.nameDec: return _ListSortType.des;
                              default: return _ListSortType.none;
                            }
                          })(),
                          ),
                  _ListSortButton(
                      title: "24h Change",
                      onPressed: () => this.setState(() {
                            switch (this._sortState) {
                              case _ListSortState.changeAsc:
                                this._sortState = _ListSortState.changeDec;
                                break;
                              default:
                                this._sortState = _ListSortState.changeAsc;
                                break;
                            }
                          }),
                          sortType: (() {
                            switch (this._sortState) {
                              case _ListSortState.changeAsc: return _ListSortType.asc;
                              case _ListSortState.changeDec: return _ListSortType.des;
                              default: return _ListSortType.none;
                            }
                          })(),
                          )
                ])),
        Expanded(
            child: ListView.separated(
                itemCount: _sortCurrencies.length,
                separatorBuilder: (_, index) =>
                    Divider(color: Color(0xFF555555).withOpacity(0.5)),
                itemBuilder: (_, index) => CurrencyListElement(
                      currency: _sortCurrencies[index],
                      onTap: () {},
                    )))
      ],
    );
  }
}

enum _ListSortType {
  asc, des, none
}

class _ListSortButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final _ListSortType sortType;

  _ListSortButton({this.title, this.onPressed, this.sortType});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _renderChild(),
      onPressed: onPressed,
    );
  }

  Widget _renderChild() {
    switch (this.sortType) {
      case _ListSortType.none: return _onlyTitle();
      default: return _withImage();
    }
  }

  Widget _withImage() => Row(children: [
        Text(title,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
        SizedBox(width: 4),
        SvgPicture.asset(
          this.sortType == _ListSortType.asc ? Images.icSortAsc : Images.icSortDes,
        ),
      ]);

  Widget _onlyTitle() => Text(title,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12));
}
