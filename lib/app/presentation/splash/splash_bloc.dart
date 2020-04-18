import 'package:crypto_currency/app/base/base_bloc.dart';
import 'package:rxdart/subjects.dart';

class SplashBloc extends BaseBloc {

  PublishSubject<bool> timeoutListener;

  @override
  void init() {
    this.timeoutListener = PublishSubject();
    Future.delayed(Duration(seconds: 1), () {
      this.timeoutListener.sink.add(true);
    });
  }

  @override
  void dispose() {
    this.timeoutListener.close();
  }
}