import 'package:flutter/material.dart';

@override
Widget customDropDown(List<String> items, String value, void onChange(item),
    Null Function(dynamic from) param2) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
    child: DropdownButton<String>(
      value: value,
      onChanged: (String? item) {
        onChange(item);
      },
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
    ),
  );
}
// items: items.map<DropdownItem<String>>((String item) {
//             retutn DropdownMenuItem(
//               child: Text(item),
//               value: item,
//             );
//           }).toList(),