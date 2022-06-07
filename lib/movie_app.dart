
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mixins/routes/routes.dart';

class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: "Movie App",
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      routes: routesPage,
      initialRoute: homeRoute,
    );
  }
}