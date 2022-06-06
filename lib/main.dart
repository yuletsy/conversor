import 'package:conversor/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'services/api_currency.dart';

void main(){
  runApp(MaterialApp(home:HomePage()));
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF212936);
  Color secondaryColor = Color(0xFF2849E5);
  ApiClient client = ApiClient();
  late List<String> currencies;
  String from = "";
  late String to;
  late double rate;
  late String result;
  // Future<List<String>> getCurrenciesList() async {
  //   return await client.getCurrencies();
  // }

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    });
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
                        child: Column(children: [
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
                            children: [
                              // customDropDown(currencies, from, (item) {
                              //   setState(() {
                              //     from = item;
                              //   });
                              // })
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
                ))));
  }
}

//         appBar: AppBar(
//           title: Text('Conversor Divisas'),
//         ),
//         body: ListView(children: [
//           Container(child: Form(key: formKey, child: Column(children: [])))
//         ]));
//   }

//   Widget obtenerPrimeraDivisa() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(labelText: 'Primera Divisa', hintText: ""),
//       validator: (value) {
//         String patron = r'^[^@]+@[^@]+\.[^@]+$';
//         RegExp regExp = RegExp(patron);
//         if (regExp.hasMatch(value!)) {
//           return null;
//         } else {
//           return 'Email incorrecto';
//         }
//       },
//     );
//   }

//   Widget obtenerCampoPass() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       obscureText: true,
//       decoration: InputDecoration(labelText: "Contraseña"),
//       validator: (value) {
//         if (value!.length > 5) {
//           return null;
//         } else {
//           return 'Contraseña muy corta';
//         }
//       },
//     );
//   }

//   Widget obtenerBoton() {
//     return ElevatedButton(
//         child: Text("Validar"),
//         onPressed: () {
//           if (formKey.currentState!.validate()) {
//             formKey.currentState!.reset();
//           }
//         });
//   }
// }

