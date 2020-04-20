
class CurrencyResponse {
  String coindcxName, baseCurrencyShortName, targetCurrencyShortName, targetCurrencyName, baseCurrencyName, symbol, ecode, pair, status;
  // int minQuantity, maxQuantity, baseCurrencyPrecision, targetCurrencyPrecision, step, maxLeverage, maxLeverageShort;
  // double minPrice, maxPrice, minNotional;
  // List<String> orderTypes;

  CurrencyResponse({
    this.coindcxName,
    this.baseCurrencyShortName,
    this.targetCurrencyShortName,
    this.targetCurrencyName,
    this.baseCurrencyName,
    // this.minQuantity,
    // this.maxQuantity,
    // this.minPrice,
    // this.maxPrice,
    // this.minNotional,
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
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) {
    return CurrencyResponse(
      coindcxName: json["coindcx_name"].toString(),
      baseCurrencyShortName: json["base_currency_short_name"].toString(),
      targetCurrencyShortName: json["target_currency_short_name"].toString(),
      targetCurrencyName: json["target_currency_name"].toString(),
      baseCurrencyName: json["base_currency_name"].toString(),
      // minQuantity: json["min_quantity"].toInt(),
      // maxQuantity: json["max_quantity"].toInt(),
      // minPrice: json["min_price"].toDouble(),
      // maxPrice: json["max_price"].toDouble(),
      // minNotional: json["min_notional"].toDouble(),
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