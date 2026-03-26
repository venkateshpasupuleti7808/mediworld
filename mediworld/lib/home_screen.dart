import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userType;

  const HomeScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medinature")),
      body: Center(
        child: Text(
          "Welcome $userType",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}