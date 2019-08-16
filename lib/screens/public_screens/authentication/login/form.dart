import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tribe/blocs/Authentication/bloc.dart';
import 'package:tribe/blocs/Authentication/reducer.dart';
import 'package:tribe/blocs/IfAuthenticated/bloc.dart';
import 'package:tribe/main.dart';
import 'package:tribe/models/Login.dart';
import 'package:tribe/screens/public_screens/authentication/login/login_button.dart';
import 'package:tribe/screens/public_screens/authentication/login/login_with_social_button.dart';
import 'package:tribe/utils/common/colors.dart';
import 'package:tribe/utils/common/text_field.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  LoginFormData _loginFormData = LoginFormData();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  void _onEmailChanged() {}

  void _onPasswordChanged() {}

  _onFormSubmitted() {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      print(_loginFormData.password);
      _authenticationBloc
          .dispatch(LoginWithCredentialsPressed(data: _loginFormData));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<IfAuthenticatedBloc>(context).dispatch(LoggedIn());
          Navigator.of(context).popAndPushNamed(RootScreen.route);
        }
      },
      child: Form(
        key: _loginFormKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                )),
                width: 90.0,
                height: 90.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
              ),
              TextInputField(
                textEditController: _emailController,
                label: "Email",
                textType: TextInputType.emailAddress,
                secureText: false,
                textFieldValue: (value) => _loginFormData.email = value,
              ),
              // ),
              SizedBox(
                height: 20.0,
              ),
              TextInputField(
                textEditController: _passwordController,
                label: "Password",
                textType: TextInputType.text,
                secureText: true,
                textFieldValue: (value) => _loginFormData.password = value,
              ),

              SizedBox(
                height: 10.0,
              ),
              forgotPassword(),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              LoginButton(
                onPressed: _onFormSubmitted,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Or'),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 180.0,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              LoginWithSocial(
                color: Theme.of(context).primaryColor,
                text: "Continue with facebook",
                icon: FontAwesomeIcons.facebookF,
              ),
              SizedBox(
                height: 20,
              ),
              LoginWithSocial(
                color: tribeGoogleLoginButtonColor,
                text: "Continue with google",
                icon: FontAwesomeIcons.googlePlusG,
              ),
              SizedBox(
                height: 25,
              ),
              dontHaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }

  FlatButton dontHaveAnAccount() {
    return FlatButton(
      onPressed: () => {},
      child: Text(
        "Dont't have an account?",
        style: TextStyle(
          color: Color(0xFF232A39),
          fontSize: 14.0,
        ),
      ),
    );
  }

  InkWell forgotPassword() {
    return InkWell(
      onTap: () => print("Forgot password"),
      child: Text(
        "Forgot password?",
        style: TextStyle(
          color: Color(0xFF232A39),
          fontSize: 14.0,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
