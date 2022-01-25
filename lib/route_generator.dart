import 'package:book_mate/views/docs/privacy_policy.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/privacy_policy':
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
