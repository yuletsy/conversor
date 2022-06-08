class Currency{
  String id = "";

Currency.fromJson(Map jsonCurrencyResponse){
  this.id = jsonCurrencyResponse["id"];
}
Currency.empty(){
  this.id = "";
}


}
