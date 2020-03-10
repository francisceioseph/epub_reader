import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as ft;

class EpubBookImage extends StatelessWidget {
  final EpubBook book;

  EpubBookImage({@required this.book});

  @override
  Widget build(BuildContext context) {
    final cover = book.CoverImage;
    final Widget child = cover == null
        ? ft.Image.asset(
            'assets/images/book_cover.jpg',
            fit: BoxFit.scaleDown,
          )
        : ft.Image.memory(cover.getBytes());

    return Container(
      margin: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: child,
      ),
    );
  }
}
