import 'dart:convert';
import 'package:crypto_currency/networking/end_point.dart';
import 'package:crypto_currency/networking/http_method.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:data_connection_checker/data_connection_checker.dart';

//https://api.coindcx.com/exchange/v1/markets_details
class NetworkManager {

  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() => _singleton;

  NetworkManager._internal();



  final _baseUrl = "https://api.coindcx.com/";
  final _client = Client();

  final _dataConnectionChecker = DataConnectionChecker();
  Future<bool> get _isConnected  => _dataConnectionChecker.hasConnection;

  Future<dynamic> callAPI({
      HTTPMethod method,
      EndPoint endPoint,
  }) async {

    bool isConnected = await this._isConnected;
    if (!isConnected) {
      throw "No internet connection";
    }

    Response response;
    var uri = Uri.https(this._baseUrl, EndPointHelper.getAPIEndpoint(endPoint));
    switch(method) {
      case HTTPMethod.get: {
        response = await _client.get(uri);
        break;
      }

      case HTTPMethod.post: {
        response = await _client.post(uri);
        break;
      }

      case HTTPMethod.put: {
        response = await _client.get(uri);
        break;
      }

      case HTTPMethod.delete: {
        response = await _client.get(uri);
        break;
      }
    }

    return json.decode(response.body);
  }
}