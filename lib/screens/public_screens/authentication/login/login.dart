import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tribe/blocs/Authentication/bloc.dart';
import 'package:tribe/screens/public_screens/authentication/login/form.dart';
import 'package:tribe/services/auth_service.dart';
import 'package:tribe/utils/common/colors.dart';

class LoginScreen extends StatelessWidget {
  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    AppBar appBar;
    if (height > 568.0) {
      appBar = AppBar(
        backgroundColor: tribeBackgroundWhite,
        elevation: 0.0,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: BlocProvider<AuthenticationBloc>(
        builder: (context) => AuthenticationBloc(
          authService: AuthService(),
        ),
        child: LoginForm(),
      ),
    );
  }
}
