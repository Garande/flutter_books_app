import 'package:book_mate/views/docs/privacy_policy_screen.dart';
import 'package:book_mate/views/docs/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/privacy_policy':
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case '/terms_and_conditions':
        return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            backgroundColor: Colors.red,
          ),
        );
    }
  }
}
