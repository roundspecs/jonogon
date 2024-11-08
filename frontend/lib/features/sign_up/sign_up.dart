import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign up logic
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
