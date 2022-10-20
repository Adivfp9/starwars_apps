import 'package:flutter/material.dart';
import 'package:starwars_apps/routes/routes.dart';
import 'package:starwars_apps/ui/home/species.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarWars Species',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.grey[900],
        fontFamily: 'Nunito',
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
      // home: const SpeciesPage(),
    );
  }
}
