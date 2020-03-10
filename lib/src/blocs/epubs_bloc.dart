import 'package:epub/epub.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_ebook_reader/src/repositories/file_repository.dart';

class EpubsBloc {
  final _epubBookFetcher = PublishSubject<EpubBook>();
  final _epubBookOutput = BehaviorSubject<Map<String, EpubBook>>();

  final _fileRepository = FileRepository();

  EpubsBloc() {
    _epubBookFetcher.transform(_epubBookTransformer()).pipe(_epubBookOutput);
  }

  Stream<Map<String, EpubBook>> get books => _epubBookOutput.stream;

  fetchBooks() {
    _fileRepository.getEpubBooks().listen(_epubBookFetcher.sink.add);
  }

  _epubBookTransformer() {
    return ScanStreamTransformer((
      Map<String, EpubBook> books,
      EpubBook book,
      int index,
    ) {
      return {
        ...books,
        '${book.Title}': book,
      };
    }, <String, EpubBook>{});
  }

  dispose() {
    _epubBookFetcher.close();
    _epubBookOutput.close();
  }
}
