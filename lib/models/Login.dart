class LoginFormData {
  String email;
  String password;

  /// Creating login value to json object
  Map<String, dynamic> toJSON() => {
        'email': email,
        'password': password,
      };
}
