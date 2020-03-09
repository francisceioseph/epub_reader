import 'package:carousel_slider/carousel_slider.dart';
import 'package:epub/epub.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class EpubView extends StatelessWidget {
  final EpubBook book;

  EpubView({@required this.book});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
      height: MediaQuery.of(context).size.height,
      itemCount: book.Chapters.length,
      itemBuilder: (BuildContext context, int index) {
        final chapter = book.Chapters[index];

        return SingleChildScrollView(
          child: Container(
            child: Html(
              data: chapter.HtmlContent,
              customTextStyle: (node, style) {
                return style.copyWith(fontFamily: 'EB Garamond');
              },
            ),
          ),
        );
      },
    );
  }
}
