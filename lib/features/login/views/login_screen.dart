import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molix/config/routes/routes.dart';
import 'package:molix/features/login/bloc/login_bloc.dart';
import 'package:molix/utils/validators.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  // form validation key
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        builder: (context, tween, child) => Opacity(
          opacity: tween,
          child: child,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Text(
                'mOlIx',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 40),
              _form(context),
              const SizedBox(height: 32),
              _loginButton(context),
              _forgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: Validators.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: Validators.password,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      );

  Widget _loginButton(BuildContext context) =>
      BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            context.router.replace(const HomeRoute());
          }
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(
                        PressLoginButtonEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                }
              },
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        },
      );

  Widget _forgotPassword(BuildContext context) => TextButton(
        onPressed: () {},
        child: Text('Forgot Password?',
            style: Theme.of(context).textTheme.bodyMedium),
      );
}
