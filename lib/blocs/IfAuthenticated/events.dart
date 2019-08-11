abstract class IfAuthEvents {}

class AppStarted extends IfAuthEvents {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends IfAuthEvents {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends IfAuthEvents {
  @override
  String toString() => 'LoggedOut';
}
