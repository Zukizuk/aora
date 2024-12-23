import 'package:aora/components/widgets/gradient_button.dart';
import 'package:aora/components/widgets/text_field.dart';
import 'package:aora/utils/theme.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                'Sign In',
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
                    label: 'Email',
                    hint: 'Your email address',
                    controller: emailController,
                  ),
                  const SizedBox(height: 22),
                  CustomTextField(
                    label: 'Password',
                    hint: 'Your password',
                    controller: passwordController,
                    obscureText: true,
                    isPasswordField: true,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GradientButton(
                  text: 'Sign In',
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Signup',
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
