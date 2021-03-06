import 'dart:ui';

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final items = ['General', 'Food', 'Movements', 'Health', 'Personalized'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            iconSize: 36,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            isExpanded: true,
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) => setState(() => this.value = value),
            hint: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Category",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 18),
        ),
      );
}
