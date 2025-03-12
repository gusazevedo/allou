import 'package:allou/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void handleLogout() {
    final auth = AuthService();

    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allou'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: handleLogout,
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(child: Text('Hi there')),
    );
  }
}
