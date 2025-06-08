import 'package:base_nest/core/navigation/route_manager.dart';
import 'package:base_nest/services/local_storage_service.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _navigate(context),
          builder: (context, snapshot) {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<void> _navigate(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final token = LocalStorageService().getToken();

    if (token != null && token.isNotEmpty) {
      if(context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.home, (route) => false);
      }
    } else {
      if(context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.login, (route) => false);
      } }
  }
}
