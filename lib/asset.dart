class Asset {
  // {
  //   "id": "bitcoin",
  //   "rank": "1",
  //   "symbol": "BTC",
  //   "name": "Bitcoin",
  //   "supply": "17193925.0000000000000000",
  //   "maxSupply": "21000000.0000000000000000",
  //   "marketCapUsd": "119150835874.4699281625807300",
  //   "volumeUsd24Hr": "2927959461.1750323310959460",
  //   "priceUsd": "6929.8217756835584756",
  //   "changePercent24Hr": "-0.8101417214350335",
  //   "vwap24Hr": "7175.0663247679233209"
  // },

  String? id;
  String? rank;
  String? symbol;
  String? name;
  String? supply;
  String? maxSupply;
  String? marketCapUsd;
  String? volumeUsd24Hr;
  String? priceUsd;
  String? changePercent24Hr;
  String? vwap24Hr;

  Asset();

  Asset.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.rank = json['rank'];
    this.symbol = json['symbol'];
    this.name = json['name'];
    this.supply = json['supply'];
    this.maxSupply = json['maxSupply'];
    this.marketCapUsd = json['marketCapUsd'];
    this.volumeUsd24Hr = json['volumeUsd24Hr'];
    this.priceUsd = json['priceUsd'];
    this.changePercent24Hr = json['changePercent24Hr'];
    this.vwap24Hr = json['vwap24Hr'];
  }
}
