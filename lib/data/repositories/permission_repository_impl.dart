import 'package:permission_handler/permission_handler.dart';
import '../../domain/repositories/permission_repository.dart';
import '../../domain/entities/permission_state.dart';
import '../../utils/logger.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  @override
  Future<PermissionState> requestCameraPermission() async{

    // TODO: implement requestCameraPermission
    final status = await Permission.camera.status;

    if (status.isGranted) {
      return PermissionState.granted;
    } else if (status.isPermanentlyDenied) {
      return PermissionState.permanentlyDenied;
    }

    final result = await Permission.camera.request();

    if (result.isGranted) {
      return PermissionState.granted;
    } else if (result.isPermanentlyDenied) {
      return PermissionState.permanentlyDenied;
    } else {
      return PermissionState.denied;
    }
  }

  @override
  Future<PermissionState> requestStoragePermission() async{
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    final isStorageVersion = Platform.isAndroid && androidInfo.version.sdkInt < 33;

    final status = isStorageVersion ? await Permission.storage.status : await Permission.photos.status;
    if (status.isGranted) {
      return PermissionState.granted;
    } else if (status.isPermanentlyDenied) {
      return PermissionState.permanentlyDenied;
    }

    final result = isStorageVersion ? await Permission.storage.request(): await Permission.photos.request();

    if (result.isGranted) {
      return PermissionState.granted;
    } else if (result.isPermanentlyDenied) {
      return PermissionState.permanentlyDenied;
    } else {
      return PermissionState.denied;
    }
  }
  
  @override
  Future<PermissionState> requestNotificationPermission() async{
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    final isNeedVersion = !(Platform.isAndroid && androidInfo.version.sdkInt < 33);
    if (isNeedVersion){
      final status = await Permission.notification.status;
      if (status.isGranted) {
        return PermissionState.granted;
      } else if (status.isPermanentlyDenied) {
        return PermissionState.permanentlyDenied;
      }

      final result = await Permission.notification.request();

      if (result.isGranted) {
        return PermissionState.granted;
      } else if (result.isPermanentlyDenied) {
        return PermissionState.permanentlyDenied;
      } else {
        return PermissionState.denied;
      }
    }
    else{
      return PermissionState.granted;
    }
  }
}