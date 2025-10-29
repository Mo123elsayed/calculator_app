import 'package:calculator_app/core/routing/routes.dart';
import 'package:calculator_app/features/calculation/cubit/calculator_cubit/calculator_cubit.dart';
import 'package:calculator_app/features/calculation/presentation/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  /// Generate a route based on the given route settings.
  ///
  /// This function will return a [MaterialPageRoute] that is built based on the
  /// given [RouteSettings]. If no route is defined for the given settings, it
  /// will return a [MaterialPageRoute] with a [Scaffold] that displays a
  /// [Text] indicating that no route was found for the given settings.
  ///
  /// The route settings contain the name of the route and any arguments that
  /// were passed when the route was pushed.
  ///
  /// For example, if a route was pushed with the following code:
  ///
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CalculatorCubit(),
            child: CalculatorScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
