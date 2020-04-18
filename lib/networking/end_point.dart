

enum EndPoint {
  fetchMarketDetails
}

class EndPointHelper {
  static String getAPIEndpoint(EndPoint endPoint) {
    switch (endPoint) {
      case EndPoint.fetchMarketDetails: return "exchange/v1/markets_details/";
    }
  }
}