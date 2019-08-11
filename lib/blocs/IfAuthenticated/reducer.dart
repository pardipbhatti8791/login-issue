import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tribe/blocs/IfAuthenticated/bloc.dart';
import 'package:tribe/models/User.dart';
import 'package:tribe/services/auth_service.dart';

class IfAuthenticatedBloc extends Bloc<IfAuthEvents, IfAuthenticatedState> {
  final AuthService authService;

  /// Checking authservice not null
  IfAuthenticatedBloc({@required this.authService})
      : assert(authService != null);

  @override
  IfAuthenticatedState get initialState => Uninitialized();

  @override
  Stream<IfAuthenticatedState> mapEventToState(IfAuthEvents event) async* {
    if (event is AppStarted) {
      try {
        final isSignedIn = await authService.isAuthenticated();
        if (isSignedIn) {
          final User authenticatedUser = await authService.authUser;

          yield Authenticated(user: authenticatedUser);
        } else {
          yield Unauthenticated();
        }
      } catch (_) {
        yield Unauthenticated();
      }
    }
    if (event is LoggedIn) {
      try {
        final isSignedIn = await authService.isAuthenticated();
        if (isSignedIn) {
          final User authenticatedUser = await authService.authUser;
          print(authenticatedUser.email);
          yield Authenticated(user: authenticatedUser);
        } else {
          yield Unauthenticated();
        }
      } catch (_) {
        yield Unauthenticated();
      }
    }
    if (event is LoggedOut) {
      yield Unauthenticated();
      print(currentState);
      await authService.logout();
    }
  }
}
