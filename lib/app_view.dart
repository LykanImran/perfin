import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfin/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:perfin/core/util/const.dart';
import 'package:perfin/core/util/style_guide.dart';
import 'package:perfin/screens/auth/welcome_screen.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'screens/home/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '$appName',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: primaryBackground,
              onBackground: Colors.black,
              primary: primaryColor,
              onPrimary: Colors.black,
              error: Colors.red,
              outline: primaryColor),
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
