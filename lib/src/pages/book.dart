import 'dart:io';

import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/utils/epub.dart';
import 'package:flutter_ebook_reader/src/widgets/epub_view.dart';
import 'package:flutter_ebook_reader/src/widgets/error_indicator.dart';
import 'package:flutter_ebook_reader/src/widgets/loading_indicator.dart';

class BookPage extends StatelessWidget {
  static final String routeName = '/book';

  final FileSystemEntity file;

  BookPage({@required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<EpubBook>(
          future: EpubUtils.readEpubFile(file),
          builder: (BuildContext context, AsyncSnapshot<EpubBook> bookSnap) {
            if (!bookSnap.hasData) {
              return LoadingIndicator();
            }

            if (bookSnap.hasError) {
              return ErrorIndicator(errorMessage: "Can't read book :(");
            }

            final book = bookSnap.data;

            return Container(
              child: EpubView(
                book: book,
              ),
            );
          },
        ),
      ),
    );
  }
}
