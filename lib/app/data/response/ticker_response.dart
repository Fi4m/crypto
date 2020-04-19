

class TickerResponse {
  String market, change24hour, high, low, volume, lastPrice, bid, ask;
  // int timestamp;

  TickerResponse({
    this.market, this.change24hour, this.high, this.low, this.volume, this.lastPrice, this.bid, this.ask
  });

  factory TickerResponse.fromJson(Map<String, dynamic> json) {
    return TickerResponse(
      market: json["market"].toString(),
      change24hour: json["change_24_hour"].toString(),
      high: json["high"].toString(),
      low: json["low"].toString(),
      volume: json["volume"].toString(),
      lastPrice: json["last_price"].toString(),
      bid: json["bid"].toString(),
      ask: json["ask"].toString(),
      // timestamp: json["timestamp"].toInt(),
    );
  }
}