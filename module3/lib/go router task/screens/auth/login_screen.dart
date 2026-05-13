import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessage = '';

  void login() {
    final username = emailController.text;
    final password = passwordController.text;

    if (username == 'admin' && password == '1234') {
      errorMessage = '';

      context.push('/dashboard');
    } else {
      setState(() {
        errorMessage = 'Wrong username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),

            const SizedBox(height: 16),

            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Back to Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}