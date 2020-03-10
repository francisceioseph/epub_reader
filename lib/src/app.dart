import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/blocs/epubs_bloc_provider.dart';
import 'package:flutter_ebook_reader/src/routes/router.dart';

class App extends StatelessWidget {
  final router = Router();

  @override
  Widget build(BuildContext context) {
    return EpubsBlocProvider(
      child: MaterialApp(
        title: 'Epub Reader',
        initialRoute: '/',
        onGenerateRoute: router.onGenerateRoute,
      ),
    );
  }
}
