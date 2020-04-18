import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import "package:collection/collection.dart";

class MarketDetailsResponse extends MarketDetailsEntity {
  List<CurrencyResponse> currencies;

  MarketDetailsResponse({this.currencies})
      : super(
            markets: groupBy(
                currencies, (currency) => currency.baseCurrencyShortName));

  factory MarketDetailsResponse.fromJson(List<dynamic> json) {
    return MarketDetailsResponse(
        currencies: json
            .map((e) => CurrencyResponse.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class CurrencyResponse extends CurrencyEntity {
  String coindcxName;
  String baseCurrencyShortName;
  String targetCurrencyShortName;
  String targetCurrencyName;
  String baseCurrencyName;
  // int minQuantity;
  // int maxQuantity;
  double minPrice;
  double maxPrice;
  double minNotional;
  // int baseCurrencyPrecision;
  // int targetCurrencyPrecision;
  // int step;
  // List<String> orderTypes;
  String symbol;
  String ecode;
  // int maxLeverage;
  // int maxLeverageShort;
  String pair;
  String status;

  CurrencyResponse({
    this.coindcxName,
    this.baseCurrencyShortName,
    this.targetCurrencyShortName,
    this.targetCurrencyName,
    this.baseCurrencyName,
    // this.minQuantity,
    // this.maxQuantity,
    this.minPrice,
    this.maxPrice,
    this.minNotional,
    // this.baseCurrencyPrecision,
    // this.targetCurrencyPrecision,
    // this.step,
    // this.orderTypes,
    this.symbol,
    this.ecode,
    // this.maxLeverage,
    // this.maxLeverageShort,
    this.pair,
    this.status,
  }) : super(
          coindcxName: coindcxName,
          baseCurrencyShortName: baseCurrencyShortName,
          targetCurrencyShortName: targetCurrencyShortName,
          targetCurrencyName: targetCurrencyName,
          baseCurrencyName: baseCurrencyName,
        );

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) {
    return CurrencyResponse(
      coindcxName: json["coindcx_name"].toString(),
      baseCurrencyShortName: json["base_currency_short_name"].toString(),
      targetCurrencyShortName: json["target_currency_short_name"].toString(),
      targetCurrencyName: json["target_currency_name"].toString(),
      baseCurrencyName: json["base_currency_name"].toString(),
      // minQuantity: json["min_quantity"].toInt(),
      // maxQuantity: json["max_quantity"].toInt(),
      minPrice: json["min_price"].toDouble(),
      maxPrice: json["max_price"].toDouble(),
      minNotional: json["min_notional"].toDouble(),
      // baseCurrencyPrecision: json["base_currency_precision"].toInt(),
      // targetCurrencyPrecision: json["target_currency_precision"].toInt(),
      // step: json["step"].toInt(),
      // orderTypes: json['order_types'].toList().map((e) => e.toString()),
      symbol: json["symbol"].toString(),
      ecode: json["ecode"].toString(),
      // maxLeverage: json["max_leverage"].toInt(),
      // maxLeverageShort: json["max_leverage_short"].toInt() ?? null,
      pair: json["pair"].toString(),
      status: json["status"].toString(),
    );
  }
}
