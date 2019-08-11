import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tribe/blocs/Authentication/bloc.dart';
import 'package:tribe/services/auth_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationState> {
  final AuthService authService;

  AuthenticationBloc({@required this.authService})
      : assert(authService != null);

  @override
  AuthenticationState get initialState => AuthenticationState.empty();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvents event) async* {
    if (event is LoginWithCredentialsPressed) {
      yield AuthenticationState.loading();
      try {
        final response = await authService.login(event.data);
        await authService.saveToken(response["token"]);
        yield AuthenticationState.success();
      } catch (_) {
        print(_);
        yield AuthenticationState.failure();
      }
    }
  }
}
