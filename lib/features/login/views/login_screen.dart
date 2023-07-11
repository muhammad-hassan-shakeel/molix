import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MOLEX',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 80),
          _form(context),
          const SizedBox(height: 32),
          _loginButton(context),
          _forgotPassword(context),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
            ),
          ],
        ),
      );

  Widget _loginButton(BuildContext context) => Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: FilledButton(
          onPressed: () {},
          child: Text(
            'Login',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );

  Widget _forgotPassword(BuildContext context) => TextButton(
        onPressed: () {},
        child: Text('Forgot Password?',
            style: Theme.of(context).textTheme.bodyMedium),
      );
}
