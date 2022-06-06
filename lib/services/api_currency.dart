import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "api/v7/currencies",
      {"apiKey": "73371dec8ff9feee74f7"});

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["Results"];
      List<String> currencies = (list.keys.toList());
      print(currencies);
      return currencies;
    } else {
      throw Exception("Failed to connect to API ");
    }
  }

  Future<double> getRate(String from, String to) async {
    final Uri rateURL = Uri.https('free.currconv.com', 'api/v7/convert', {
      "apiKey": "73371dec8ff9feee74f7",
      "q": "${from}_${to}",
      "compact ": "ultra"
    });
    http.Response res = await http.get(rateURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return body["${from}_${to}"];
    } else {
      throw Exception("Failed to connect to API ");
    }
  }
}
