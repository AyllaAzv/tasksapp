import 'package:flutter/material.dart';

class AppTextArea extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;
  Icon icon;

  AppTextArea(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: TextInputType.multiline,
      textInputAction: textInputAction,
      focusNode: focusNode,
      maxLines: null,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(
        fontSize: 18,
      ),
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
    );
  }
}
