import 'package:flutter/material.dart';

class AppButtonLogin extends StatelessWidget {
  String text;
  Function onPressed;
  bool showProgress;

  AppButtonLogin(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: OutlineButton(
        onPressed: onPressed,
        borderSide: BorderSide(color: Colors.white),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
      ),
    );
  }
}
