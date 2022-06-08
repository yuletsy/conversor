import 'dart:convert';
import 'package:conversor/home_page/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:conversor/services/listCurrencyAPI.dart';
import 'currencyAPI.dart';

class ProviderApi {
  Future<ListCurrency> getCurrencies() async {
    try {
      var url = Uri.parse("https://exchangecurrenciesdemo.herokuapp.com/api/convert/usd/cop");

      var responseHttp = await http.get(url);

      String rawResponse = utf8.decode(responseHttp.bodyBytes);

      var jsonResponse = jsonDecode(rawResponse);

      ListCurrency currencyResponse =
          ListCurrency.fromAPI(jsonResponse);

      return currencyResponse;
    } catch (ex) {
      return ListCurrency.vacio();
    }
  }

  Future<double> getRate(String from, String to) async {
    final Uri rateURL = Uri.parse('https://exchangecurrenciesdemo.herokuapp.com/api/convert/usd/cop');
    var res = await http.get(rateURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return body["${from}_${to}"];
    } else {
      throw Exception("Failed to connect to API ");
    }
  }
}