import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/pages/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epub Reader',
      initialRoute: '/',
      onGenerateRoute: _generateRoutes,
    );
  }

  Route _generateRoutes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return HomePage();
        },
      );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return HomePage();
      },
    );
  }
}
