import 'dart:async';
import 'dart:io';
import 'package:catcord/core/constants/app_strings.dart';
import 'package:catcord/core/navigation/navigation_service.dart';
import 'package:catcord/presentation/widgets/dialog/default_dialog.dart';
import 'package:catcord/presentation/widgets/images/logo_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/permission_viewmodel.dart';
import 'login_screen.dart';
import '../../core/enums/permission_state.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _navigated = false;
  bool _requested = false;

  @override
  void initState() {
    super.initState();
    // 여기서는 실제 요청 로직을 build 후에 실행되게 함
    Future.microtask(() async {
      await ref.read(permissionProvider.notifier).requestAllPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    requestPermission();

    final size = MediaQuery.of(context).size;
    final navigationService = NavigationService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: size.width * 0.4, child: const LogoForm()),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void requestPermission(){
    final permission = ref.watch(permissionProvider);
    
    // 권한이 허용된 경우
    if (!_navigated && permission == PermissionState.granted) {
      _navigated = true;
      Future.delayed(const Duration(seconds: 1), () {
        NavigationService().replaceWith(LoginScreen());
      });
    }

    // 권한이 거부된 경우 (권한 요청을 시도한 이후에만 처리)
    if (!_navigated && _requested && permission == PermissionState.denied) {
      _navigated = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => DefaultDialog(
            title: AppStrings.permissionRequestTitle,
            dialogMessage: AppStrings.permissionDeniedMessage,
            onConfirm: () {
              NavigationService().replaceWith(LoginScreen());
            },
          ),
        );
      });
    }

    // 권한 요청 후 상태를 추적하기 위한 플래그 설정
    if (!_requested && permission != PermissionState.initial) {
      _requested = true;
    }
  }
}