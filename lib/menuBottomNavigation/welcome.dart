import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String? username;

  const WelcomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Text('Welcome, $username!'),
      ),
    );
  }
}
