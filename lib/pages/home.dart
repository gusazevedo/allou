import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allou'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(child: Text('Hi there')),
    );
  }
}
