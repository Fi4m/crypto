
import 'package:crypto_currency/app/base/base_bloc.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/domain/use_case/fetch_market_details_use_case.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class CurrencyListBloc extends BaseBloc {
  
  FetchMarketDetailsUseCase fetchMarketDetailsUseCase;
  BehaviorSubject<MarketDetailsEntity> marketDetails;
  BehaviorSubject<MarketDetailsEntity> filteredResults;

  @provide
  CurrencyListBloc(
    this.fetchMarketDetailsUseCase
  );

  void fetchMarketDetails() async {
    try {
      final response = await fetchMarketDetailsUseCase.fetchMarketDetails();
      marketDetails.sink.add(response);
      filteredResults.sink.add(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  void init() {
    marketDetails = BehaviorSubject<MarketDetailsEntity>();
    filteredResults = BehaviorSubject<MarketDetailsEntity>();
  }

  @override
  void dispose() {
    marketDetails.close();
    filteredResults.close();
  }
}