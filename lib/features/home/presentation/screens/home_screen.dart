import 'package:base_nest/core/navigation/route_manager.dart';
import 'package:base_nest/features/auth/presentation/providers/auth_provider.dart';
import 'package:base_nest/services/connectivity_service.dart';
import 'package:base_nest/shared/providers/localization_provider.dart';
import 'package:base_nest/shared/providers/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final localizationProvider = Provider.of<LocalizationProvider>(context, listen: false);
final connectivity = Provider.of<ConnectivityService>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              _showLanguageDialog(context, localizationProvider);
            },
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              if(context.mounted) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              }
              },
          ),
        ],
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Welcome to Home Screen!'),
          ),
          Text(connectivity.isConnected
    ? 'Connected via ${connectivity.connectionType}'
    : 'No Internet')
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, LocalizationProvider localizationProvider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English'),
              onTap: () {
                localizationProvider.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Arabic'),
              onTap: () {
                localizationProvider.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
