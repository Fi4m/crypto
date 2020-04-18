import 'package:crypto_currency/app/data/response/market_details_response.dart';
import 'package:crypto_currency/networking/end_point.dart';
import 'package:crypto_currency/networking/http_method.dart';
import 'package:crypto_currency/networking/network_manager.dart';

class FetchMarketDetailsService {
  NetworkManager networkManager;

  FetchMarketDetailsService(this.networkManager);

  Future<List<MarketDetailsResponse>> fetchMarketDetails() async {
    final response = await networkManager.callAPI(
      method: HTTPMethod.get,
      endPoint: EndPoint.fetchMarketDetails,
    );
    List<Map<String, dynamic>> temp = List.from(response);
    return temp.map((map) => MarketDetailsResponse.fromJson(map));
  }
}
