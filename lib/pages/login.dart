import 'package:allou/components/custom_input.dart';
import 'package:allou/services/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final VoidCallback handleRegister;
  LoginPage({super.key, required this.handleRegister});

  void handleLogin(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (error) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Warning'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('Try again'),
                  ),
                ],
                content: Text(error.toString()),
              ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WelcomeMessage(),
                SizedBox(height: 80),
                CustomInput(
                  textHint: 'Type your email',
                  keyboardInputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                SizedBox(height: 15),
                CustomInput(
                  isPassword: true,
                  textHint: 'Type your password',
                  controller: _passwordController,
                ),
                SizedBox(height: 30),
                LoginButton(onPressed: () => handleLogin(context)),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: handleRegister,
                  child: const Text('Register now'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final void Function() onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
      ),
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to \nAllou 👋',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          Text(
            'Start chating with your team members!',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
