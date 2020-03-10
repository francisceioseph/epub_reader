import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/pages/book.dart';
import 'package:flutter_ebook_reader/src/routes/book_arguments.dart';
import 'package:flutter_ebook_reader/src/widgets/epub_book_image.dart';

class EpubBookCard extends StatelessWidget {
  final EpubBook book;

  EpubBookCard({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              BookPage.routeName,
              arguments: BookArguments(book),
            );
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                EpubBookImage(book: book),
                Container(
                  child: Text(
                    book.Title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                  ),
                ),
                Container(
                  child: Text(
                    book.Author,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  margin: EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
