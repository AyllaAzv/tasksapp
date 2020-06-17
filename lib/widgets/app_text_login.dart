import 'package:flutter/material.dart';

class AppTextLogin extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;
  Icon icon;

  AppTextLogin(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(0.0),
          child: icon // icon is 48px widget.
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
