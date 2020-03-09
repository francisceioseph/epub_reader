import 'package:carousel_slider/carousel_slider.dart';
import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/services/epub_book_service.dart';
import 'package:flutter_ebook_reader/src/widgets/epub_book_chapter_view.dart';

class EpubBookView extends StatelessWidget {
  final EpubBookService _epubBookService = EpubBookService();
  final EpubBook book;

  EpubBookView({@required this.book});

  @override
  Widget build(BuildContext context) {
    final List<EpubChapter> chapters = _epubBookService.flatChapters(
      this.book.Chapters,
    );

    return Container(
      color: Color(0xfff5f5dc),
      child: CarouselSlider.builder(
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height,
        itemCount: chapters.length,
        itemBuilder: (BuildContext context, int index) {
          final chapter = chapters[index];

          return EpubBookChapterView(
            chapter: chapter,
          );
        },
      ),
    );
  }
}
