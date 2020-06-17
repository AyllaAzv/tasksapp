import 'package:flutter/material.dart';
import 'package:tasks/constants/ColorTask.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  ColorTask color = ColorTask.PADRAO;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: ColorTask.PADRAO,
              groupValue: color,
              onChanged: (ColorTask value) {
                setState(() {
                  color = value;
                  print(color);
                });
              },
            ),
            Text(ColorTask.PADRAO.name)
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: ColorTask.VERDE,
              groupValue: color,
              onChanged: (ColorTask value) {
                setState(() {
                  color = value;
                  print(color);
                });
              },
            ),
            Text(ColorTask.VERDE.name),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: ColorTask.AMARELO,
              groupValue: color,
              onChanged: (ColorTask value) {
                setState(() {
                  color = value;
                  print(color);
                });
              },
            ),
            Text(ColorTask.AMARELO.name),
          ],
        ),
      ],
    );
  }
}
