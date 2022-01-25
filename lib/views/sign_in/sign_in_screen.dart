import 'package:book_mate/views/sign_in/widgets/complete_sign_in_view.dart';
import 'package:book_mate/views/sign_in/widgets/verify_phone_auth_view.dart';
import 'package:flutter/material.dart';

import 'widgets/phone_auth_view.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            const PhoneAuthView(),
            VerifyPhoneAuthView(),
            const CompleteSignInView(),
          ],
        ),
      ),
    );
  }
}
