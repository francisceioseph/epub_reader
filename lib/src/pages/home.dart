import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/pages/book.dart';
import 'package:flutter_ebook_reader/src/routes/book_arguments.dart';
import 'package:flutter_ebook_reader/src/utils/file.dart';
import 'package:flutter_ebook_reader/src/widgets/loading_indicator.dart';
import 'package:flutter_ebook_reader/src/widgets/storage_permission.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Epub Reader',
        ),
      ),
      body: SafeArea(
        child: Container(
          child: StoragePermission(
            child: FutureBuilder(
              future: FileUtils.getFiles(
                extension: '.epub',
              ),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<FileSystemEntity>> dirsSnap,
              ) {
                if (dirsSnap.hasData) {
                  final files = dirsSnap.data;

                  return ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(FileUtils.getFileName(files[index])),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            BookPage.routeName,
                            arguments: BookArguments(files[index]),
                          );
                        },
                      );
                    },
                  );
                }

                return Center(
                  child: LoadingIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
