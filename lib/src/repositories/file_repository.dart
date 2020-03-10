import 'dart:io';

import 'package:epub/epub.dart';

import 'package:flutter_ebook_reader/src/services/file_service.dart';

class FileRepository {
  FileService fileService = FileService();

  Stream<EpubBook> getEpubBooks() {
    return fileService
        .getFiles()
        .where((FileSystemEntity entity) => entity.path.endsWith('.epub'))
        .asyncMap(_mapToBook);
  }

  Future<EpubBook> _mapToBook(FileSystemEntity entity) {
    final File file = File(entity.path);
    return file.readAsBytes().then(EpubReader.readBook);
  }
}
