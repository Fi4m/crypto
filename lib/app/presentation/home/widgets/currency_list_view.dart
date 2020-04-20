import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/home/widgets/currency_list_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum _ListSortState { nameAsc, nameDec, changeAsc, changeDec, none }
enum _ListSortType { asc, des, none }

class CurrencyListView extends StatefulWidget {
  final List<CurrencyEntity> currencies;
  final void Function(CurrencyEntity) onTap;

  CurrencyListView(this.currencies, {this.onTap});

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
          return $0.targetCurrencyName.toLowerCase().compareTo($1.targetCurrencyName.toLowerCase());
        });
        return currencies;
      case _ListSortState.nameDec:
        widget.currencies.sort(($0, $1) {
          return $0.targetCurrencyName.toLowerCase().compareTo($1.targetCurrencyName.toLowerCase());
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
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Color(0xFF555555).withOpacity(0.5),
              width: 2,
            ))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  this._createSortByCoinNameButton(),
                  this._createSortBy24hChangeButton()
                ])),
        Expanded(
            child: ListView.separated(
                itemCount: _sortCurrencies.length,
                separatorBuilder: (_, index) =>
                    Divider(color: Color(0xFF555555).withOpacity(0.5)),
                itemBuilder: (_, index) => CurrencyListElement(
                      currency: _sortCurrencies[index],
                      onTap: this.widget.onTap,
                    )))
      ],
    );
  }

  Widget _createSortByCoinNameButton() => _ListSortButton(
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
            case _ListSortState.nameAsc:
              return _ListSortType.asc;
            case _ListSortState.nameDec:
              return _ListSortType.des;
            default:
              return _ListSortType.none;
          }
        })(),
      );

  Widget _createSortBy24hChangeButton() => _ListSortButton(
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
            case _ListSortState.changeAsc:
              return _ListSortType.asc;
            case _ListSortState.changeDec:
              return _ListSortType.des;
            default:
              return _ListSortType.none;
          }
        })(),
      );
}

class _ListSortButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final _ListSortType sortType;

  _ListSortButton({this.title, this.onPressed, this.sortType});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(children: [
        Text(title,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
        SizedBox(width: 4),
        SvgPicture.asset(this._getSortAsset(), width: 8,),
      ]),
      onPressed: onPressed,
    );
  }

  String _getSortAsset() {
    switch (this.sortType) {
      case _ListSortType.asc:
        return Images.icSortAsc;
      case _ListSortType.des:
        return Images.icSortDes;
      case _ListSortType.none:
        return Images.icSortUnsorted;
    }

    return "";
  }
}
