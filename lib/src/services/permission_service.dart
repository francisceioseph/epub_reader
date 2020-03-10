import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionHandler _permissionManager = PermissionHandler();

  Stream<bool> requesStoragePermission() {
    final permission =
        _permissionManager.requestPermissions([PermissionGroup.storage]);

    return Stream.fromFuture(permission).map((permissionData) {
      if (permissionData[PermissionGroup.storage] == PermissionStatus.granted) {
        return true;
      }

      return false;
    });
  }
}
