import 'package:crypto_currency/app/base/domain_convertible.dart';
import 'package:crypto_currency/app/data/response/currency_response.dart';
import 'package:crypto_currency/app/data/response/ticker_response.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import "package:collection/collection.dart";

class MarketDetailsResponse extends DomainConvertible<MarketDetailsEntity> {
  List<CurrencyResponse> currencies;
  List<TickerResponse> tickers;

  MarketDetailsResponse({this.currencies, this.tickers});
      // : super(
      //       markets: groupBy(
      //           currencies, (currency) => currency.baseCurrencyShortName));

  factory MarketDetailsResponse.fromJson(List<dynamic> json) {
    List<dynamic> currencies = json[0];
    List<dynamic> tickers = json[1];

    return MarketDetailsResponse(
        currencies: currencies.map((e) => CurrencyResponse.fromJson(e as Map<String, dynamic>)).toList(),
        tickers: tickers.map((e) => TickerResponse.fromJson(e as Map<String, dynamic>)).toList()
        );
  }

  @override
  MarketDetailsEntity asDomain() {
    // final CurrencyEntity entities = currencies.map((currency) => CurrencyEntity(currency: currency, ticker: tickers.firstWhere((o) => o.market == currency.coindcxName)));
    List<CurrencyEntity> entities = currencies.map((currency) {
      String coindcxName = currency.coindcxName;
      TickerResponse ticker = tickers.firstWhere((o) => o.market == coindcxName);
      if (ticker == null) 
        return null;

      return CurrencyEntity(currency: currency, ticker: ticker);
    }).toList();
    return MarketDetailsEntity(markets: groupBy(entities, (currency) => currency.baseCurrencyShortName));
  }
}
