import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:inject/inject.dart';

@provide
abstract class DomainRepo {
  Future<MarketDetailsEntity> fetchMarketDetails();
}
