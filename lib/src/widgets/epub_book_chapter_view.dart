import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class EpubBookChapterView extends StatelessWidget {
  final EpubChapter chapter;

  EpubBookChapterView({@required this.chapter});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          right: 8,
          left: 8,
        ),
        child: Html(
          data: chapter.HtmlContent,
          customTextStyle: (node, TextStyle style) {
            final newStyle = style.copyWith(fontFamily: 'EB Garamond');

            if (node.toString().contains(RegExp(r"p|span"))) {
              return newStyle.copyWith(fontSize: 20);
            }

            return newStyle;
          },
        ),
      ),
    );
  }
}
