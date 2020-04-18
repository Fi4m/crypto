import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';

class MarketDetailsResponse extends MarketDetailsEntity {
  String coindcxName;
  String baseCurrencyShortName;
  String targetCurrencyShortName;
  String targetCurrencyName;
  String baseCurrencyName;
  String minQuantity;
  String maxQuantity;
  String minPrice;
  String maxPrice;
  String minNotional;
  String baseCurrencyPrecision;
  String targetCurrencyPrecision;
  String step;
  List<String> orderTypes;
  String symbol;
  String ecode;
  String maxLeverage;
  String maxLeverageShort;
  String pair;
  String status;

  MarketDetailsResponse({
    this.coindcxName,
    this.baseCurrencyShortName,
    this.targetCurrencyShortName,
    this.targetCurrencyName,
    this.baseCurrencyName,
    this.minQuantity,
    this.maxQuantity,
    this.minPrice,
    this.maxPrice,
    this.minNotional,
    this.baseCurrencyPrecision,
    this.targetCurrencyPrecision,
    this.step,
    this.orderTypes,
    this.symbol,
    this.ecode,
    this.maxLeverage,
    this.maxLeverageShort,
    this.pair,
    this.status,
  }): super(
    
  );

  factory MarketDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MarketDetailsResponse(
    coindcxName: json["coindcx_name"].toString(),
    baseCurrencyShortName: json["base_currency_short_name"].toString(),
    targetCurrencyShortName: json["target_currency_short_name"].toString(),
    targetCurrencyName: json["target_currency_name"].toString(),
    baseCurrencyName: json["base_currency_name"].toString(),
    minQuantity: json["min_quantity"].toString(),
    maxQuantity: json["max_quantity"].toString(),
    minPrice: json["min_price"].toString(),
    maxPrice: json["max_price"].toString(),
    minNotional: json["min_notional"].toString(),
    baseCurrencyPrecision: json["base_currency_precision"].toString(),
    targetCurrencyPrecision: json["target_currency_precision"].toString(),
    step: json["step"].toString(),
    orderTypes: json['order_types'] as List<String>,
    symbol: json["symbol"].toString(),
    ecode: json["ecode"].toString(),
    maxLeverage: json["max_leverage"].toString(),
    maxLeverageShort: json["max_leverage_short"].toString(),
    pair: json["pair"].toString(),
    status: json["status"].toString(),
    );
  }
}
