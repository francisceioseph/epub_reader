import 'package:flutter/material.dart';
import 'package:flutter_ebook_reader/src/utils/file.dart';
import 'package:flutter_ebook_reader/src/widgets/error_indicator.dart';
import 'package:flutter_ebook_reader/src/widgets/loading_indicator.dart';

class StoragePermission extends StatelessWidget {
  final Widget child;

  StoragePermission({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FileUtils.requesStoragePermission(),
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> grantedSnap,
      ) {
        if (!grantedSnap.hasData) {
          return LoadingIndicator();
        }

        if (grantedSnap.hasError) {
          return ErrorIndicator(
            errorMessage: 'An error happened...',
          );
        }

        if (!grantedSnap.data) {
          return ErrorIndicator(errorMessage: 'Permissions not granted');
        }

        return this.child;
      },
    );
  }
}
