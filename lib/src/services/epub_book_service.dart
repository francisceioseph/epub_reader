import 'package:epub/epub.dart';

class EpubBookService {
  flatChapters(List<EpubChapter> chapters) {
    return chapters
        .map((chapter) {
          return [
            if (chapter.SubChapters.isEmpty) chapter,
            ...chapter.SubChapters
          ];
        })
        .expand((chapter) => chapter)
        .toList();
  }
}
