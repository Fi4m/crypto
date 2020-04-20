
import 'package:crypto_currency/app/base/base_bloc.dart';
import 'package:crypto_currency/app/domain/entity/market_details_entity.dart';
import 'package:crypto_currency/app/domain/use_case/fetch_market_details_use_case.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class CurrencyListBloc extends BaseBloc {
  
  FetchMarketDetailsUseCase fetchMarketDetailsUseCase;
  MarketDetailsEntity marketDetails;
  BehaviorSubject<List<CurrencyEntity>> filteredCurrencies;

  @provide
  CurrencyListBloc(
    this.fetchMarketDetailsUseCase
  );

  void fetchMarketDetails() async {
    try {
      final response = await fetchMarketDetailsUseCase.fetchMarketDetails();
      marketDetails = response;
      filteredCurrencies.sink.add(marketDetails.entities);
    } catch (e) {
      print(e);
    }
  }

  void searchTextDidChange(String text) {
    print(text);
    filteredCurrencies.sink.add(marketDetails.entities.where((e) => e.name.toLowerCase().contains(text.toLowerCase())).toList());
  }

  @override
  void init() {
    filteredCurrencies = BehaviorSubject();
  }

  @override
  void dispose() {
    filteredCurrencies.close();
  }
}