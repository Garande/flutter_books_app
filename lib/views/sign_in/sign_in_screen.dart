import 'package:book_mate/views/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/complete_auth_view.dart';
import 'widgets/phone_auth_view.dart';
import 'widgets/verify_phone_auth_view.dart';

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
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.requestFocus(),
        child: Scaffold(
          body: BlocListener<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state.status == SignInStatus.authInProgress) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Authenticating...'),
                          CircularProgressIndicator()
                        ],
                      ),
                    ),
                  );
              }

              if (state.status == SignInStatus.googleAuthenticated) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Google Authenticated...'),
                          Icon(Icons.check),
                        ],
                      ),
                    ),
                  );
              }

              if (state.status == SignInStatus.otpSent) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('OTP Sent...'),
                          Icon(Icons.check),
                        ],
                      ),
                    ),
                  );
                _tabController?.animateTo(1);
              }

              if (state.status == SignInStatus.otpVerificationSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('OTP Verified successfully...'),
                          Icon(Icons.check),
                        ],
                      ),
                    ),
                  );
              }

              if (state.status == SignInStatus.exception) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.error ?? 'Authentication Error'),
                          const Icon(Icons.error),
                        ],
                      ),
                    ),
                  );
              }
            },
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const PhoneAuthView(),
                VerifyPhoneAuthView(),
                CompleteAuthView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
