import 'package:base_nest/core/constants/app_spacing.dart';
import 'package:base_nest/core/navigation/route_manager.dart';
import 'package:base_nest/features/auth/presentation/providers/auth_provider.dart';
import 'package:base_nest/shared/components/custom_button.dart';
import 'package:base_nest/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _fillDemoCredentials() {
    _emailController.text = 'eve.holt@reqres.in';
    _passwordController.text = 'cityslicka';
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Demo credentials filled')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: AppSpacing.lg),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                isPassword: true,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter password' : null,
              ),

              // Demo credentials autofill
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _fillDemoCredentials,
                  child: const Text('Use Demo Credentials'),
                ),
              ),
              const SizedBox(height: AppSpacing.lg * 1),

              CustomButton(
                text: 'Login',
                isLoading: authProvider.isLoading,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool success = await authProvider.login(
                      context,
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );
                    if (success && context.mounted) {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.home);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
