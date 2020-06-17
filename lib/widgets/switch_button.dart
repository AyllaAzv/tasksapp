import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool fixar = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Fixar'),
      value: fixar,
      onChanged: (bool value) {
        setState(() {
          fixar = value;
        });
      },
    );
  }
}
