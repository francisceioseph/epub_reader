import 'dart:io';

import 'package:flutter_ebook_reader/src/services/permission_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class FileService {
  PermissionService _permissionService = PermissionService();

  Stream<FileSystemEntity> getFiles() {
    return _getStorageList().switchMap((List<Directory> storages) {
      final streams = storages
          .map(
            (s) => s.list(recursive: true),
          )
          .toList();

      return Rx.merge(streams);
    });
  }

  Stream<List<Directory>> _getStorageList() {
    return _permissionService
        .requesStoragePermission()
        .switchMap(
          (_) => Stream.fromFuture(getExternalStorageDirectories()),
        )
        .map(
          (storages) => storages
              .map(
                (dir) => _removeDataDirectory(dir.path),
              )
              .toList(),
        );
  }

  Directory _removeDataDirectory(String path) {
    return Directory(path.split("Android")[0]);
  }
}
