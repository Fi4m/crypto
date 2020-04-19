import 'package:crypto_currency/app/data/response/market_details_response.dart';
import 'package:crypto_currency/networking/end_point.dart';
import 'package:crypto_currency/networking/http_method.dart';
import 'package:crypto_currency/networking/network_manager.dart';
import 'package:inject/inject.dart';

class FetchMarketDetailsService {
  NetworkManager networkManager;

  @provide
  FetchMarketDetailsService(this.networkManager);

  Future<MarketDetailsResponse> fetchMarketDetails() async {
    final response = await Future.wait([
      networkManager.callAPI(
        method: HTTPMethod.get,
        endPoint: EndPoint.fetchMarketDetails,
      ),
      networkManager.callAPI(
        method: HTTPMethod.get,
        endPoint: EndPoint.fetchTickers,
      )
    ]);
    return MarketDetailsResponse.fromJson(response);
  }
}
