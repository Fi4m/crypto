import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';

abstract class DomainRepo {
  Future<List<MarketDetailsEntity>> fetchMarketDetails();
}
