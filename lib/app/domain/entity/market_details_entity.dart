import 'package:crypto_currency/app/data/response/currency_response.dart';
import 'package:crypto_currency/app/data/response/ticker_response.dart';
import 'package:crypto_currency/networking/currency_remote_icon.dart';
import "package:collection/collection.dart";

class MarketDetailsEntity {
  List<CurrencyEntity> entities;
  Map<String, List<CurrencyEntity>> get markets => groupBy(this.entities, (currency) => currency.baseCurrencyShortName);

  MarketDetailsEntity({this.entities});
}

class CurrencyEntity {
  String name, baseCurrencyShortName, targetCurrencyShortName, imageUrl, high, low, volume, lastPrice, bid, ask;
  double change24hour;

  CurrencyEntity({
    CurrencyResponse currency,
    TickerResponse ticker,
  }) {
    name = currency.coindcxName;
    baseCurrencyShortName = currency.baseCurrencyShortName;
    imageUrl = CurrencyIconUrlGenerator.forCurrency(currency.targetCurrencyShortName);
    change24hour = double.parse(ticker.change24hour);
    high = ticker.high;
    low = ticker.low;
    volume = ticker.volume;
    lastPrice = ticker.lastPrice;
    bid = ticker.bid;
    targetCurrencyShortName = currency.targetCurrencyShortName;
  }
}
