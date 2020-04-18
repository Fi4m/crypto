import 'package:crypto_currency/app/app.dart';
import 'package:crypto_currency/di/crypto_module.dart';
import 'package:inject/inject.dart';
import 'bloc_injector.inject.dart' as g;

@Injector(const [CryptoModule])
abstract class BlocInjector {
  @provide
  App get app;

  static final create = g.BlocInjector$Injector.create;
}