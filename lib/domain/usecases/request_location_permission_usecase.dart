import '../repositories/permission_repository.dart';
import '../../domain/entities/permission_state.dart';

class RequestLocationPermissionUseCase {
  final PermissionRepository repository;
  RequestLocationPermissionUseCase(this.repository);

  Future<PermissionState> call() => repository.requestLocationPermission();
}