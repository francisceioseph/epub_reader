import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/utils/file.dart';
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
      body: Container(
        child: StoragePermission(
          child: FutureBuilder(
            future: FileUtils.getFiles(extension: '.epub'),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<FileSystemEntity>> dirsSnap,
            ) {
              if (dirsSnap.hasData) {
                final dirs = dirsSnap.data;

                return ListView.builder(
                  itemCount: dirs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final path = dirs[index].path;
                    final name = path.split('/').last.split('.');
                    name.removeLast();

                    return ListTile(
                      title: Text(name.join('.')),
                      trailing: Icon(Icons.chevron_right),
                    );
                  },
                );
              }

              return Text('loading...');
            },
          ),
        ),
      ),
    );
  }
}
