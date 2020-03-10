import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/widgets/epub_books_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Epub Reader',
        ),
      ),
      body: SafeArea(
        child: Container(
          child: EpubBooksList(),
        ),
      ),
    );
  }
}
