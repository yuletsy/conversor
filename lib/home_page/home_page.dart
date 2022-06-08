// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:conversor/services/api_currency.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color.fromARGB(255, 16, 138, 194);
  Color secondaryColor = Color.fromARGB(255, 16, 46, 194);
  ProviderApi client = ProviderApi();
  late String valueschoose;
  late String valueschoose1;
  @override
  Widget build(BuildContext context) {
    final amount = TextEditingController();
    final total = TextEditingController();
    int cal;
    int result;

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Text("Currency Converter",
                  style: TextStyle(fontSize: 30, color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: amount,
                decoration: InputDecoration(
                    labelText: "Ingrese valor a convertir",
                    labelStyle:
                        TextStyle(fontSize: 15, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 15,
              ),
             
              
              // DropdownButton<String>(
              //     value: valueschoose,
              //     items: <String>['Pesos', 'Pesos Colombianos']
              //         .map((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(valueschoose),
              //       );
              //     }).toList(),
              //     onChanged: (value) => setState(
              //           () => value,
              //         )),
              // SizedBox(
              //   height: 15,
              // ),
              // DropdownButton<String>(
              //     value: valueschoose1,
              //     items: <String>['USD'].map((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) => setState(
              //           () =>  value,
              //         )),
              // SizedBox(
              //   height: 15,
              // ),
              TextField(
                controller: total,
                decoration: InputDecoration(
                    labelText: "Total",
                    labelStyle:
                        TextStyle(fontSize: 15, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  if (valueschoose == "Pesos Colombianos" &&
                      valueschoose1 == "COP") {
                    cal = int.parse(amount.text) * 300;
                    result = cal;
                    total.text = result.toString();
                  } else if (valueschoose == "Dollar " &&
                      valueschoose1 == "USD") {
                    cal = int.parse(amount.text) * 78;
                    result = cal;
                    total.text = result.toString();
                  }
                },
                
                child: Container(
                  alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Convert",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  
                ),
              ),
                      

            ],
          ),
        ),
      ),
    );
  }
}
