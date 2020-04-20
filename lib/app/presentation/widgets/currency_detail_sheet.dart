import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/presentation/widgets/currency_change_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyDetailSheet extends StatelessWidget {
  CurrencyEntity currency;

  CurrencyDetailSheet(this.currency);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Color(0xFF0D111B),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF20273A),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.network(currency.imageUrl,
                          height: 30,
                          width: 30,
                          placeholderBuilder: (context) => SvgPicture.asset(
                                Images.icPlaceholder,
                                height: 30,
                                width: 30,
                              )),
                      SizedBox(width: 12),
                      Text(currency.targetCurrencyName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      SizedBox(width: 4),
                      Text("(${currency.name})",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16))
                    ],
                  )),
            ),
            _paddedSpaceBetweenRow([
              _titleHeaderChild(
                  text: "LAST TRADED PRICE",
                  child: Text(
                      "${currency.lastPrice} ${currency.baseCurrencyShortName}",
                      style: TextStyle(color: Colors.white, fontSize: 16))),
              CurrencyChangeWidget(currency.change24hour)
            ]),
            Divider(color: Color(0xFF555555).withOpacity(0.5)),
            _paddedSpaceBetweenRow([
              _titleHeaderChild(
                  text: "24H HIGH",
                  child: Text(
                      "${currency.high} ${currency.baseCurrencyShortName}",
                      style: _detailTextStyle)),
              _titleHeaderChild(
                  text: "24H LOW",
                  child: Text(
                      "${currency.low} ${currency.baseCurrencyShortName}",
                      style: _detailTextStyle))
            ]),
          ],
        ),
      ),
    );
  }

  Widget _paddedSpaceBetweenRow(List<Widget> children) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children),
      );

  TextStyle get _detailTextStyle =>
      TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16);
  Widget _titleHeaderChild({String text, Widget child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5), fontSize: 10)),
          // Text(value, style: valueTextstyle),
          child
        ],
      );
}
