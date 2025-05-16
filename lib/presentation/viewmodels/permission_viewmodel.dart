import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/request_permission_usecase.dart';
import '../../data/repositories/permission_repository_impl.dart';
import '../../domain/entities/permission_state.dart';

class PermissionViewModel extends StateNotifier<PermissionState> {
  final RequestLocationPermissionUseCase permissionUseCase;

  PermissionViewModel(this.permissionUseCase) : super(PermissionState.initial);

  Future<void> requestAllPermission() async {
    state = await permissionUseCase.reqeustAllPermission();
  }
}

final permissionProvider = StateNotifierProvider<PermissionViewModel, PermissionState>((ref) {
  final repository = PermissionRepositoryImpl(); // 실제 구현체
  final useCase = RequestLocationPermissionUseCase(repository);
  return PermissionViewModel(useCase);
});