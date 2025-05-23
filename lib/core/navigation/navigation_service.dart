import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> pushTo(Widget page) async {
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  void replaceWith(Widget page) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  void pop() {
    navigatorKey.currentState?.pop();
  }
}