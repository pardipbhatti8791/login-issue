import 'package:flutter/material.dart';
import 'package:tribe/utils/common/colors.dart';

class LoginWithSocial extends StatelessWidget {
  final String text;
  Color color;
  final icon;
  Function loginWithFB;

  LoginWithSocial({this.text, this.color, this.icon, this.loginWithFB});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40.0,
      child: RaisedButton.icon(
        onPressed: () => loginWithFB(),
        icon: Icon(
          icon,
          color: tribeTextWhite,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: tribeTextWhite,
          ),
        ),
        color: color,
      ),
    );
  }
}
