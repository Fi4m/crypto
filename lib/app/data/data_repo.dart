import 'package:crypto_currency/app/data/service/fetch_market_details_service.dart';
import 'package:crypto_currency/app/domain/domain_repo.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';

class DataRepo extends DomainRepo {

  final FetchMarketDetailsService fetchMarketDetailsService;

  DataRepo(this.fetchMarketDetailsService);

  Future<List<MarketDetailsEntity>> fetchMarketDetails() {
    return fetchMarketDetailsService.fetchMarketDetails();
  }
}