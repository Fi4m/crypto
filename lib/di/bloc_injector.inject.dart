import 'bloc_injector.dart' as _i1;
import 'crypto_module.dart' as _i2;
import '../app/data/service/fetch_market_details_service.dart' as _i3;
import '../app/domain/domain_repo.dart' as _i4;
import '../app/domain/use_case/fetch_market_details_use_case.dart' as _i5;
import 'dart:async' as _i6;
import '../app/app.dart' as _i7;
import '../app/presentation/home/currency_list_bloc.dart' as _i8;

class BlocInjector$Injector implements _i1.BlocInjector {
  BlocInjector$Injector._(this._cryptoModule);

  final _i2.CryptoModule _cryptoModule;

  _i3.FetchMarketDetailsService _singletonFetchMarketDetailsService;

  _i4.DomainRepo _singletonDomainRepo;

  _i5.FetchMarketDetailsUseCase _singletonFetchMarketDetailsUseCase;

  static _i6.Future<_i1.BlocInjector> create(
      _i2.CryptoModule cryptoModule) async {
    final injector = BlocInjector$Injector._(cryptoModule);

    return injector;
  }

  _i7.App _createApp() => _i7.App(_createCurrencyListBloc());
  _i8.CurrencyListBloc _createCurrencyListBloc() =>
      _cryptoModule.currencyListBloc(_createFetchMarketDetailsUseCase());
  _i5.FetchMarketDetailsUseCase _createFetchMarketDetailsUseCase() =>
      _singletonFetchMarketDetailsUseCase ??=
          _cryptoModule.fetchMarketDetailsUseCase(_createDomainRepo());
  _i4.DomainRepo _createDomainRepo() => _singletonDomainRepo ??=
      _cryptoModule.repository(_createFetchMarketDetailsService());
  _i3.FetchMarketDetailsService _createFetchMarketDetailsService() =>
      _singletonFetchMarketDetailsService ??=
          _cryptoModule.fetchMarketDetailsService();
  @override
  _i7.App get app => _createApp();
}
