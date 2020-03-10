import 'package:epub/epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/blocs/epubs_bloc_provider.dart';
import 'package:flutter_ebook_reader/src/pages/book.dart';
import 'package:flutter_ebook_reader/src/routes/book_arguments.dart';
import 'package:flutter_ebook_reader/src/widgets/error_indicator.dart';
import 'package:flutter_ebook_reader/src/widgets/loading_indicator.dart';

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

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              final book = books[index];

              return ListTile(
                title: Text(book.Title),
                subtitle: Text(book.Author),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BookPage.routeName,
                    arguments: BookArguments(book),
                  );
                },
              );
            },
          );
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
