// main.dart
import 'package:catcord/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: CatCordApp(),
    ),
  );
}
class CatCordApp extends StatelessWidget {
  const CatCordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catcord App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      navigatorKey: NavigationService().navigatorKey, // 싱글턴 키 연결
    );
  }
}