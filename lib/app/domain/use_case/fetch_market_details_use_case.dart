
import 'package:crypto_currency/app/domain/domain_repo.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';

class FetchMarketDetailsUseCase {

  final DomainRepo repo;

  FetchMarketDetailsUseCase(this.repo);

  Future<List<MarketDetailsEntity>> fetchMarketDetails() {
    return repo.fetchMarketDetails();
  }
}