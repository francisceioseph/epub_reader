import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/blocs/epubs_bloc_provider.dart';
import 'package:flutter_ebook_reader/src/pages/root.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EpubsBlocProvider(
      child: Root(),
    );
  }
}
