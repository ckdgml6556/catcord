import '../../domain/entities/permission_state.dart';

abstract class PermissionRepository {
  Future<PermissionState> requestCameraPermission();
  Future<PermissionState> requestStoragePermission();
  Future<PermissionState> requestDespcriptionPermission();
}

