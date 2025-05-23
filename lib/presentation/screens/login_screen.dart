import 'package:catcord/core/constants/app_strings.dart';
import 'package:catcord/core/constants/meterial.dart';
import 'package:catcord/core/enums/auth_state.dart';
import 'package:catcord/core/navigation/navigation_service.dart';
import 'package:catcord/presentation/screens/home_screen.dart';
import 'package:catcord/presentation/viewmodels/auth_viewmodel.dart';
import 'package:catcord/presentation/viewmodels/validation_viewmodel.dart';
import 'package:catcord/presentation/widgets/buttons/main_button.dart';
import 'package:catcord/presentation/widgets/dialog/default_dialog.dart';
import 'package:catcord/presentation/widgets/images/logo_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catcord/core/utils/logger.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isListenerRegistered = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  
  }

  void _checkAuth(AuthState auth) {
    switch (auth) {
      case AuthState.auth:
        NavigationService().replaceWith(const HomeScreen());
        break;
      case AuthState.unauth:
        showDefaultDialog(
          context: context,
          title:AppStrings.authFailTitle,
          message:AppStrings.authFailMessage,
          onConfirm: () =>{
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);  // 다이얼로그 닫기
            })
          }
        );
        break;
      case AuthState.serverFail:
        showDefaultDialog(
          context: context,
          title:AppStrings.authServerErrorTitle,
          message:AppStrings.authServerErrorMessage,
          onConfirm: () => {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);  // 다이얼로그 닫기
            })
          }
        );
        break;
      default:
        break;
    }
  }

  Future<void> _handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await ref.read(authProvider.notifier).login(email, password);
    } catch (e) {
      logger.d('Login error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isValidEmail = ref.watch(validEmailProvider);
    final isValidPassword = ref.watch(validPasswordProvider);
    final size = MediaQuery.of(context).size;

    _checkAuth(authState);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width * 0.4,
                  child: const LogoForm(),
                ),
              ),
              const SizedBox(height: 10),

              /// 이메일 입력
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.appMainColor,
                decoration: InputDecoration(
                  hintText: AppStrings.loginEmailInput,
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.appMainColor),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  // 올바른 이메일 검증
                  ref.read(validEmailProvider.notifier).checkEmail(value);
                },
              ),

              const SizedBox(height: 10),

              /// 비밀번호 입력
              TextField(
                controller: passwordController,
                obscureText: true,
                cursorColor: AppColors.appMainColor,
                decoration: InputDecoration(
                  hintText: AppStrings.loginPasswordInput,
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.appMainColor),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.lock),
                ),
                onChanged: (value) {
                  // 올바른 패스워드 검증
                  ref.read(validPasswordProvider.notifier).checkPassword(value);
                },
              ),

              const SizedBox(height: 20),

              /// 로그인 버튼
              SizedBox(
                width: double.infinity,
                child: MainButton(
                  onRequest: _handleLogin, // 비동기 함수로 변경
                  text: AppStrings.loginButton,
                  isEnable: isValidEmail && isValidPassword, // 유효성 검사 결과 반영
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}