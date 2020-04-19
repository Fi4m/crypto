import 'package:crypto_currency/app/data/response/market_details_response.dart';
import 'package:crypto_currency/app/data/service/fetch_market_details_service.dart';
import 'package:crypto_currency/app/domain/domain_repo.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:inject/inject.dart';

class DataRepo extends DomainRepo {

  final FetchMarketDetailsService fetchMarketDetailsService;

  @provide
  DataRepo(this.fetchMarketDetailsService);

  Future<MarketDetailsEntity> fetchMarketDetails() async {
    MarketDetailsResponse marketDetailsResponse = await fetchMarketDetailsService.fetchMarketDetails();
    return marketDetailsResponse.asDomain();
  }
}