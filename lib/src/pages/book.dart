import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/widgets/epub_book_view.dart';

class BookPage extends StatelessWidget {
  static final String routeName = '/book';

  final EpubBook book;

  BookPage({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EpubBookView(book: book),
      ),
    );
  }
}
