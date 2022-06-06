// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:conversor/widgets/drop_down.dart';

import '../services/api_currency.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF212936);
  Color secondaryColor = Color(0xFF2849E5);
  ApiClient client = ApiClient();
  late List<String> currencies;
  late String from;
  late String to;
  late double rate;
  String result = "";
  Future<List<String>> getCurrenciesList() async {
    return await client.getCurrencies();
  }

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200.0,
                      child: Text(
                        "Currency converter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                          TextField(
                            onSubmitted: (value) async {
                              rate = await client.getRate(from, to);
                              setState(() {
                                result = (rate * double.parse(value))
                                    .toStringAsFixed(3);
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Input valor a convertir",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                )),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            customDropDown(currencies, from,(val){
                              setState(() {
                                from = val;
                              });
                            }),
                            FloatingActionButton(onPressed:(){
                              String temp = from;
                              setState(() {
                                from =  to;
                                to = temp;
                              });
                            }, child:Icon(Icons.swap_horiz),elevation: 0.0, backgroundColor: secondaryColor),
                            customDropDown(currencies, to,(val){
                              setState(() {
                                from = val;
                              });
                            }),
                            ],
                          ),
                          SizedBox(height: 50.0),
                          Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(children: [
                                Text("result",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(result,
                                    style: TextStyle(color: secondaryColor)),
                              ]))
                        ]),
                      ),
                    )
                  ],
                ),),),);
  }
}
