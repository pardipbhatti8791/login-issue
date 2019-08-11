import 'package:tribe/models/User.dart';

abstract class IfAuthenticatedState {}

class Uninitialized extends IfAuthenticatedState {
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends IfAuthenticatedState {
  final User user;

  Authenticated({this.user});
}

class Unauthenticated extends IfAuthenticatedState {
  @override
  String toString() => 'Unauthenticated';
}
