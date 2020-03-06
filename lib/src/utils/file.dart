import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUtils {
  static PermissionHandler _permissionManager = PermissionHandler();

  static Future<bool> requesStoragePermission() async {
    final permissions =
        await _permissionManager.requestPermissions([PermissionGroup.storage]);

    if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
      return true;
    }

    return false;
  }

  static Future<List<Directory>> getStorageList() async {
    List<Directory> storages = await getExternalStorageDirectories();
    List<Directory> roots = storages
        .map(
          (dir) => removeDataDirectory(dir.path),
        )
        .toList();

    return roots;
  }

  static _filterFilesByExtension({
    @required List<FileSystemEntity> files,
    @required String extension,
  }) {
    return files
        .where(
          (FileSystemEntity entity) => entity.path.endsWith(extension),
        )
        .toList();
  }

  static List<FileSystemEntity> _sortFilesByName({
    @required List<FileSystemEntity> files,
  }) {
    files.sort((previous, current) {
      final previousName = previous.path.split('/').last;
      final currentName = current.path.split('/').last;

      return previousName.compareTo(currentName);
    });

    return files;
  }

  static Future<List<FileSystemEntity>> getFiles({String extension}) async {
    final storages = await getStorageList();
    final files = storages
        .map((Directory storage) => storage.listSync(recursive: true))
        .expand((List<FileSystemEntity> files) => files)
        .toList();

    if (extension != null) {
      return _sortFilesByName(
        files: _filterFilesByExtension(
          files: files,
          extension: extension,
        ),
      );
    }

    return _sortFilesByName(files: files);
  }

  static Directory removeDataDirectory(String path) {
    return Directory(path.split("Android")[0]);
  }
}
