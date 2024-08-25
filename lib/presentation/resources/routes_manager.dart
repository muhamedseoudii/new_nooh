import 'package:flutter/material.dart';
import 'package:nooh/presentation/home/home_view.dart';
import 'package:nooh/presentation/navigator_bar/nav_view.dart';
import 'package:nooh/presentation/resources/string_manager.dart';
import 'package:nooh/presentation/search/search_view.dart';
import 'package:nooh/presentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String navbarRoute = "/navbar";
  static const String homeRoute = "/home";
  static const String searchRoute = "/search";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.navbarRoute:
        return MaterialPageRoute(builder: (_) => MyNavigatorBar(title: "home"));
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(child: Text(AppStrings.noRouteFound)),
        );
      },
    );
  }
}
