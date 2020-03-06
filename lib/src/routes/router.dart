import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/pages/book.dart';
import 'package:flutter_ebook_reader/src/pages/home.dart';
import 'package:flutter_ebook_reader/src/routes/book_arguments.dart';

class Router {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return HomePage();
        },
      );
    }

    if (settings.name == BookPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext contex) {
          final BookArguments arguments = settings.arguments;

          return BookPage(
            file: arguments.file,
          );
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
