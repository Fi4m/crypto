
class MarketDetailsEntity {
  Map<String, List<CurrencyEntity>> markets;

  MarketDetailsEntity({
    this.markets
  });
}

class CurrencyEntity {
  String coindcxName;
  String baseCurrencyShortName;
  String targetCurrencyShortName;
  String targetCurrencyName;
  String baseCurrencyName;

  CurrencyEntity({
    this.coindcxName,
    this.baseCurrencyShortName,
    this.targetCurrencyShortName,
    this.targetCurrencyName,
    this.baseCurrencyName,
  });
}