
import 'package:crypto_currency/app/base/base_bloc.dart';
import 'package:crypto_currency/app/domain/use_case/fetch_market_details_use_case.dart';
import 'package:inject/inject.dart';

class CurrencyListBloc extends BaseBloc {
  
  FetchMarketDetailsUseCase fetchMarketDetailsUseCase;

  @provide
  CurrencyListBloc(
    this.fetchMarketDetailsUseCase
  );

  @override
  void init() {

  }

  @override
  void dispose() {

  }
}