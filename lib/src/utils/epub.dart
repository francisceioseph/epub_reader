import 'dart:io';

import 'package:epub/epub.dart';

class EpubUtils {
  static Future<EpubBook> readEpubFile(FileSystemEntity entity) async {
    final File file = File(entity.path);
    final List<int> bytes = await file.readAsBytes();
    return EpubReader.readBook(bytes);
  }
}
