import 'package:aora/components/widgets/gradient_button.dart';
import 'package:aora/components/widgets/text_field.dart';
import 'package:aora/utils/theme.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 122),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 115,
              ),
              const SizedBox(height: 40),
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  CustomTextField(
                    label: 'Username',
                    hint: 'Your unique username',
                    controller: usernameController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Email',
                    hint: 'Your email address',
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Password',
                    hint: 'Your password',
                    controller: passwordController,
                    obscureText: true,
                    isPasswordField: true,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: GradientButton(
                  text: 'Sign Up',
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
