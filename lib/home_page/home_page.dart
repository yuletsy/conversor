import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Conversor Divisas'),
        ),
        body: ListView(children: [
          Container(child: Form(key: formKey, child: Column(children: [])))
        ]));
  }

  Widget obtenerPrimeraDivisa() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Primera Divisa', hintText: ""),
      validator: (value) {
        String patron = r'^[^@]+@[^@]+\.[^@]+$';
        RegExp regExp = RegExp(patron);
        if (regExp.hasMatch(value!)) {
          return null;
        } else {
          return 'Email incorrecto';
        }
      },
    );
  }

  Widget obtenerCampoPass() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(labelText: "Contraseña"),
      validator: (value) {
        if (value!.length > 5) {
          return null;
        } else {
          return 'Contraseña muy corta';
        }
      },
    );
  }

  Widget obtenerBoton() {
    return ElevatedButton(
        child: Text("Validar"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.reset();
          }
        });
  }
}
