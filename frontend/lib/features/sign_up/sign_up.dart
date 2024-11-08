import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.loose(const Size.fromWidth(500)),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              ),
              const SizedBox(height: 10),
              const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              ),
              const SizedBox(height: 10),
              const TextField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              ),
              const SizedBox(height: 10),
              const TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text('Sign Up'),
              ),
              TextButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
