import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/blocs/epubs_bloc_provider.dart';
import 'package:flutter_ebook_reader/src/routes/router.dart';

class Root extends StatelessWidget {
  final _router = Router();
  @override
  Widget build(BuildContext context) {
    final bloc = EpubsBlocProvider.of(context);
    bloc.fetchBooks();

    return MaterialApp(
      title: 'Epub Reader',
      initialRoute: '/',
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}
