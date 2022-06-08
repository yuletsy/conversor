import 'package:conversor/services/currencyAPI.dart';


class ListCurrency {
  List<Currency> listCurrency = <Currency>[];
  ListCurrency.fromAPI(Map jsonCurrencyResponse){
    for (int i = 0; i < jsonCurrencyResponse["contactList"].length; i++) {
      Currency cm =
          Currency.fromJson(jsonCurrencyResponse["contactList"][i]);
      this.listCurrency.add(cm);
    }
  }

  ListCurrency.vacio() {
    this.listCurrency = List.empty();
  }
}
