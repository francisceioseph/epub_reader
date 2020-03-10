import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/blocs/epubs_bloc_provider.dart';
import 'package:flutter_ebook_reader/src/widgets/epub_book_card.dart';
import 'package:flutter_ebook_reader/src/widgets/error_indicator.dart';
import 'package:flutter_ebook_reader/src/widgets/loading_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EpubBooksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = EpubsBlocProvider.of(context);

    return StreamBuilder(
      stream: bloc.books,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, EpubBook>> booksSnap,
      ) {
        if (booksSnap.hasData) {
          final books = booksSnap.data.values.toList();

          return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                return EpubBookCard(book: books[index]);
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.fit(2);
              });

          // return Container(
          //   padding: EdgeInsets.only(top: 16),
          //   child: CustomScrollView(
          //     primary: false,
          //     slivers: <Widget>[
          //       SliverStaggeredGrid.countBuilder(
          //         mainAxisSpacing: 8,
          //         crossAxisSpacing: 8,
          //         crossAxisCount: 4,
          //         itemCount: books.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return EpubBookCard(book: books[index]);
          //         },
          //         staggeredTileBuilder: (int index) {
          //           return StaggeredTile.fit(2);
          //         },
          //       )
          //     ],
          //   ),
          // );

          // return GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //   ),
          //   itemCount: books.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return EpubBookCard(book: books[index]);
          //   },
          // );
        }

        if (booksSnap.hasError) {
          return Center(
            child: ErrorIndicator(
              errorMessage: booksSnap.error.toString(),
            ),
          );
        }

        return Center(
          child: LoadingIndicator(),
        );
      },
    );
  }
}
