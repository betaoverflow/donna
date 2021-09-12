import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.green,
            shadowColor: Colors.greenAccent,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 150, vertical: 12),
            elevation: 7.0),
        child: Text(text),
        onPressed: onClicked,
      );
}
