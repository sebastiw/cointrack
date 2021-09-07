import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'asset.dart';

class CoinCap {
  static const String BASE_URL = "api.coincap.io";

  Future<dynamic> get(url) async {
    var finalUrl = Uri.https(BASE_URL, url, {});
    final response = await http.get(finalUrl);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Error: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('Request: $url');
      throw Exception('Failed to load data');
    }
  }

  Future<List<Asset>> assets() async {
// {
//   "data": [
//     {
//       "id": "bitcoin",
//       "rank": "1",
//       "symbol": "BTC",
//       "name": "Bitcoin",
//       "supply": "17193925.0000000000000000",
//       "maxSupply": "21000000.0000000000000000",
//       "marketCapUsd": "119150835874.4699281625807300",
//       "volumeUsd24Hr": "2927959461.1750323310959460",
//       "priceUsd": "6929.8217756835584756",
//       "changePercent24Hr": "-0.8101417214350335",
//       "vwap24Hr": "7175.0663247679233209"
//     },
//   ],
//   "timestamp": 1533581088278
// }

    final url = 'v2/assets';
    return get(url).then((value) {
      print("Got $value");
      return (value['data'] ?? []).map<Asset>((a) => Asset.fromJson(a)).toList();
    });
  }
}

class CoinCapCandle {
// api.coincap.io/v2/candles?exchange=poloniex&interval=h8&baseId=ethereum&quoteId=bitcoin
// {"data":[{
//     "open":"0.0778147800000000",
//     "high":"0.0780780000000000",
//     "low":"0.0767502700000000",
//     "close":"0.0769291600000000",
//     "volume":"1478.9198616500000000",
//     "period":1630857600000
//   }],
//  "timestamp":1630876620495
// }
  late String open;
  late String high;
  late String low;
  late String close;
  late String volume;
  late int period;
  late int timestamp;
}
