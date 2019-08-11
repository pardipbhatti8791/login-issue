import 'package:tribe/models/Login.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvents {}

class EmailChanged extends AuthenticationEvents {
  final String email;

  EmailChanged({@required this.email});

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends AuthenticationEvents {
  final String password;

  PasswordChanged({@required this.password});

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends AuthenticationEvents {
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password});

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class LoginWithCredentialsPressed extends AuthenticationEvents {
  final LoginFormData data;

  LoginWithCredentialsPressed({@required this.data});

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: ${data.email}, password: ${data.password} }';
  }
}

class LoginWithGooglePressed extends AuthenticationEvents {
  @override
  String toString() => 'LoginWithGooglePressed';
}

class LoginWithFacebookPressed extends AuthenticationEvents {
  @override
  String toString() => 'LoginWithFacebookPressed';
}
