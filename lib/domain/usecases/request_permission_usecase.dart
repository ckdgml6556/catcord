import '../repositories/permission_repository.dart';
import '../../domain/entities/permission_state.dart';

class RequestLocationPermissionUseCase {
  final PermissionRepository repository;
  RequestLocationPermissionUseCase(this.repository);

  Future<PermissionState> reqeustAllPermission() async {
    final cameraResult = await repository.requestCameraPermission();
    final storageResult = await repository.requestStoragePermission();
    final notificationResult = await repository.requestNotificationPermission();

    if (cameraResult == PermissionState.granted &&
        storageResult == PermissionState.granted &&
        notificationResult == PermissionState.granted) {
      return PermissionState.granted;
    } else {
      return PermissionState.denied;
    }
  }

  Future<PermissionState> reqeustCameraPermission() async {
    return await repository.requestCameraPermission();
  }

  Future<PermissionState> reqeustStoragePermission() async {
    return await repository.requestStoragePermission();
  }
}