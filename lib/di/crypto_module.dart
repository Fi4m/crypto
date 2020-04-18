import 'package:crypto_currency/app/data/data_repo.dart';
import 'package:crypto_currency/app/data/service/fetch_market_details_service.dart';
import 'package:crypto_currency/app/domain/domain_repo.dart';
import 'package:crypto_currency/app/domain/use_case/fetch_market_details_use_case.dart';
import 'package:crypto_currency/app/presentation/currency_list/currency_list_bloc.dart';
import 'package:crypto_currency/networking/network_manager.dart';
import 'package:inject/inject.dart';

@module
class CryptoModule {
  
  @provide
  @singleton
  FetchMarketDetailsService fetchMarketDetailsService() => FetchMarketDetailsService(NetworkManager());

  @provide
  @singleton
  DomainRepo repository(FetchMarketDetailsService fetchMarketDetailsService) => DataRepo(fetchMarketDetailsService);

  @provide
  @singleton
  FetchMarketDetailsUseCase fetchMarketDetailsUseCase(DomainRepo repository) => FetchMarketDetailsUseCase(repository);

  @provide
  CurrencyListBloc currencyListBloc(FetchMarketDetailsUseCase fetchMarketDetailsUseCase) => CurrencyListBloc(fetchMarketDetailsUseCase);
}