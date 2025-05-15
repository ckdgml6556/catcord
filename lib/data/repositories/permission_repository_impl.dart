import 'package:permission_handler/permission_handler.dart';
import '../../domain/repositories/permission_repository.dart';
import '../../domain/entities/permission_state.dart';
import '../../utils/logger.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  @override
  Future<PermissionState> requestLocationPermission() async {
    final status = await Permission.location.status;

    if (status.isGranted) {
      return PermissionState.granted;
    } else if (status.isPermanentlyDenied) {
      logger.d("Request Location initial isPermanentlyDenied");
      return PermissionState.permanentlyDenied;
    }

    final result = await Permission.location.request();
    logger.d("Request Location");

    if (result.isGranted) {
      return PermissionState.granted;
    } else if (result.isPermanentlyDenied) {
      return PermissionState.permanentlyDenied;
    } else {
      return PermissionState.denied;
    }
  }
}