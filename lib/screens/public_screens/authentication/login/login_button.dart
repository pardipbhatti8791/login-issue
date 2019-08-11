import 'package:flutter/material.dart';
import 'package:tribe/utils/common/colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      // minWidth: 350.0,
      height: 40.0,
      buttonColor: tribeButtonColor,
      child: RaisedButton(
        disabledColor: tribeButtonColor.withAlpha(150),
        onPressed: _onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        child: Text(
          'Login',
          style:
              TextStyle(color: tribeTextWhite, fontSize: tribeFontSizeButtons),
        ),
      ),
    );
  }
}
