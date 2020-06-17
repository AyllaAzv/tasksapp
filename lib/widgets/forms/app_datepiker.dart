import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AppTextDatePiker extends StatelessWidget {
  final format = DateFormat("dd/MM/yyyy");

  String label;
  String hint;
  Icon icon;
  TextEditingController controller;
  FormFieldValidator<DateTime> validator;

  AppTextDatePiker(
    this.label,
    this.hint,
    this.icon, {
    this.controller,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Padding(padding: EdgeInsets.all(0.0), child: icon),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 17,
        ),
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(2020),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
          locale: Locale('pt', 'BR'),
        );
      },
    );
  }
}
