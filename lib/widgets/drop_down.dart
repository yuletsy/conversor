import 'package:flutter/material.dart';

@override
Widget customDropDown(
  List<String> items, 
  String value,
  void onChange(val) 
  )  {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
    child: DropdownButton<String>(
      value: value,
      onChanged:(String? val) {
        onChange(val);
      },
      items: items
          .map<DropdownMenuItem<String>>(
            (String val) {
            return DropdownMenuItem(
              child: Text(val),
              value: val,
            );
            }
          ).toList(),
    ),
  );
}
// items: items.map<DropdownItem<String>>((String item) {
//             return DropdownMenuItem(
//               child: Text(item),
//               value: item,
//             );
//           }).toList(),
//  items: items
//           .map<DropdownMenuItem<String>>(
//             (String val) => DropdownMenuItem(
//               value: val,
//               child: Text(val),
//             ),
//           )
//           .toList(),