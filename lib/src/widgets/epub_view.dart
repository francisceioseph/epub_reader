import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class EpubView extends StatelessWidget {
  final EpubBook book;

  EpubView({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: book.Chapters.length,
        itemBuilder: (BuildContext context, int index) {
          final chapter = book.Chapters[index];
          return Container(
            color: Color(0xfff2eecb),
            child: Html(
              data: chapter.HtmlContent,
            ),
          );
        },
      ),
    );
  }
}
