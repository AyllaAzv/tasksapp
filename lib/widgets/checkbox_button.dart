import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxButton extends StatefulWidget {
  @override
  _CheckboxButtonState createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton> {
  bool pessoal = false;
  bool trabalho = false;
  bool estudo = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              value: pessoal,
              onChanged: (bool value) {
                setState(() {
                  pessoal = value;
                });
              },
            ),
            Text('Pessoal')
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: trabalho,
              onChanged: (bool value) {
                setState(() {
                  trabalho = value;
                });
              },
            ),
            Text('Trabalho')
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: estudo,
              onChanged: (bool value) {
                setState(() {
                  estudo = value;
                });
              },
            ),
            Text('Estudo'),
          ],
        )
      ],
    );
  }
}
