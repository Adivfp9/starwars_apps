import 'package:flutter/material.dart';
import 'package:starwars_apps/ui/home/species.dart';
import 'package:starwars_apps/ui/home/species_detail.dart';
import 'package:starwars_apps/ui/splash_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/species':
        return MaterialPageRoute(builder: (_) => const SpeciesPage());
      case SpeciesDetail.routeName:
        final args = settings.arguments as SpeciesDetail;
        return MaterialPageRoute(builder: (context) {
          return SpeciesDetail(urlDetail: args.urlDetail, specId: args.specId);
        });
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
    }
  }
}
