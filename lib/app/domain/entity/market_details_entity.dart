import 'package:crypto_currency/app/data/response/currency_response.dart';
import 'package:crypto_currency/app/data/response/ticker_response.dart';
import 'package:crypto_currency/networking/currency_remote_icon.dart';

class MarketDetailsEntity {
  Map<String, List<CurrencyEntity>> markets;

  MarketDetailsEntity({this.markets});
}

class CurrencyEntity {
  String name, baseCurrencyShortName, targetCurrencyShortName, imageUrl, change24hour, high, low, volume, lastPrice, bid, ask;

  CurrencyEntity({
    CurrencyResponse currency,
    TickerResponse ticker,
  }) {
    name = currency.coindcxName;
    baseCurrencyShortName = currency.baseCurrencyShortName;
    imageUrl = CurrencyIconUrlGenerator.forCurrency(currency.targetCurrencyShortName);
    change24hour = ticker.change24hour;
    high = ticker.high;
    low = ticker.low;
    volume = ticker.volume;
    lastPrice = ticker.lastPrice;
    bid = ticker.bid;
    targetCurrencyShortName = currency.targetCurrencyShortName;
  }
}
