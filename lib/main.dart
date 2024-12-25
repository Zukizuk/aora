import 'package:aora/components/layouts/auth_gate.dart';
import 'package:aora/components/layouts/layout.dart';
import 'package:aora/pages/sign_in_page.dart';
import 'package:aora/pages/sign_up_page.dart';
import 'package:aora/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthGate(
              signedInScreen: Layout(),
              signedOutScreen: SignInPage(),
              signUpScreen: SignUpPage(),
            ),
        '/sign-up': (context) => AuthGate(
              signedInScreen: Layout(),
              signedOutScreen: SignInPage(),
              signUpScreen: SignUpPage(),
            ),
        '/sign-in': (context) => AuthGate(
              signedInScreen: Layout(),
              signedOutScreen: SignInPage(),
              signUpScreen: SignUpPage(),
            ),
      },
    );
  }
}
