import 'package:crypto_currency/app/base/images.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/networking/currency_remote_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyListElement extends StatelessWidget {
  final CurrencyEntity currency;
  final GestureTapCallback onTap;

  CurrencyListElement({this.currency, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: SizedBox(
        height: 44,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(children: [
            SvgPicture.network(currency.imageUrl,
                height: 28,
                width: 28,
                placeholderBuilder: (context) => SvgPicture.asset(
                      Images.icPlaceholder,
                      height: 28,
                      width: 28,
                    )),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    currency.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                    currency.lastPrice,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              width: 64,
              height: 28,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Center(
                child: Text("${currency.change24hour}%",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
