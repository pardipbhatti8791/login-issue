import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tribe/models/Login.dart';
import 'package:tribe/models/User.dart';
import 'package:tribe/utils/jwt/jwt.dart';

class AuthService {
  /// initalVariables
  final String url = "https://tribeathlon.co.uk";
  String _token = '';
  User _authUser;
  User loginWithFbTypes = User();

  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();

  /// @setter authUser
  set authUser(Map<String, dynamic> value) {
    _authUser = User.fromJSON(value);
  }

  /// @getter authUser, @description: can get current logged in user data
  get authUser => _authUser;

  /// @getter: token, @description: getter to get token
  Future<String> get token async {
    if (_token.isNotEmpty) {
      return _token;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('tribeToken');
    }
  }

  /// @method: _persistToken, @description: helper function to save token in SharedPreferences
  Future<bool> _persistToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('tribeToken', token);
  }

  /// @method: saveToken, @description: saving to storage
  Future<bool> saveToken(String token) async {
    if (token != null) {
      await _persistToken(token);
      _token = token;
      return true;
    }
    return false;
  }

  /// @method isAuthenticated, @description: checking token is valid and setting auth user data from token
  Future<bool> isAuthenticated() async {
    final token = await this.token;
    if (token != null && token.isNotEmpty) {
      final decodedToken = decode(token);
      final bool isValidToken =
          decodedToken['exp'] * 1000 > DateTime.now().millisecond;
      if (isValidToken) {
        authUser = decodedToken;
      }
      return isValidToken;
    }

    return false;
  }

  /// @_removeAuthData @description: private function to clear token from SharedPreferences and setting user null
  _removeAuthData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('tribeToken');
    _token = '';
    _authUser = null;
  }

  /// @method logout, @description clearing token from storage
  Future<bool> logout() async {
    try {
      await _removeAuthData();
    } catch (error) {
      print(error);
    }
  }

  /// @method login, @description login
  Future<Map<String, dynamic>> login(LoginFormData loginData) async {
    final body = json.encode(loginData.toJSON());

    final response = await http.post('$url/api/users/login',
        headers: {"Content-Type": "application/json"}, body: body);

    final parsedData = Map<String, dynamic>.from(json.decode(response.body));
    if (response.statusCode == 200) {
      authUser = parsedData;
      return parsedData;
    } else {
      return Future.error(parsedData);
    }
  }
}
