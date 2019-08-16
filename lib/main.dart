import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tribe/blocs/IfAuthenticated/bloc.dart';
import 'package:tribe/blocs/IfAuthenticated/reducer.dart';
import 'package:tribe/screens/public_screens/authentication/login/login.dart';
import 'package:tribe/screens/public_screens/slides/slides.dart';
import 'package:tribe/screens/public_screens/splash/splash_screen.dart';
import 'package:tribe/services/auth_service.dart';

import 'blocs/IfAuthenticated/events.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<IfAuthenticatedBloc>(
          builder: (BuildContext context) =>
              IfAuthenticatedBloc(authService: AuthService())
                ..dispatch(
                  AppStarted(),
                ),
        )
      ],
      child: TribeApp(),
    ),
  );
}

class TribeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        RootScreen.route: (context) => RootScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        SlidesScreen.route: (context) => SlidesScreen(),
      },
    );
  }
}

class RootScreen extends StatelessWidget {
  static String route = '/';
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<IfAuthenticatedBloc>(context);
    return BlocBuilder<IfAuthenticatedBloc, IfAuthenticatedState>(
      builder: (BuildContext context, IfAuthenticatedState state) {
        if (state is Unauthenticated) {
          return SlidesScreen();
        }
        if (state is Authenticated) {
          return Scaffold(
            body: Container(
              child: Center(
                child: RaisedButton(
                  onPressed: () => authenticationBloc.dispatch(LoggedOut()),
                  child: Text('Log Out'),
                ),
              ),
            ),
          );
        }
        return SplashScreen();
      },
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('bloc: ${bloc.runtimeType}, error: $error');
  }
}
