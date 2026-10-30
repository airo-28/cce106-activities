import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final String username;
  final String password;
  const LandingPage({
    super.key,
    required this.username,
    required this.password,
  });

  @override
    return Scaffold(
      appBar: AppBar(title: const Text("Parondo - task 6")), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("user: $username", style: const TextStyle(fontSize: 30)),
            SizedBox(height: 30),
            Text("Password: $password", style: const TextStyle(fontSize: 30)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Back to Login"), // Text
            ), // ElevatedButton
          ],
        ), // Column
      ), // Center
    ); // Scaffold
  }
}
