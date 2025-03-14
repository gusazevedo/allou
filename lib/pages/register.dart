import 'package:allou/components/custom_input.dart';
import 'package:allou/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final VoidCallback handleLogin;
  RegisterPage({super.key, required this.handleLogin});

  void handleRegister(BuildContext context) async {
    final auth = AuthService();

    try {
      await auth.signUpEmailPassword(
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text,
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
                SizedBox(height: 15),
                CustomInput(
                  isPassword: true,
                  textHint: 'Confirm password',
                  controller: _confirmPasswordController,
                ),
                SizedBox(height: 30),
                RegisterButton(onPressed: () => handleRegister(context)),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: handleLogin,
                  child: const Text('Already have account? Login now'),
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

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;
  const RegisterButton({super.key, required this.onPressed});

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
        'Register',
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
