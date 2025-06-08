 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true;
  ConnectivityResult? _connectionType;

  bool get isConnected => _isConnected;
  ConnectivityResult? get connectionType => _connectionType;

  ConnectivityService() {
    _init();
  }

  void _init() {
    _connectivity.onConnectivityChanged.listen((dynamic result) {
      if (result is ConnectivityResult) {
        _updateConnectionStatus(result);
      } else if (result is List<ConnectivityResult>) {
        _updateConnectionStatus(result.isNotEmpty ? result.first : ConnectivityResult.none);
      }
    });
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final dynamic result = await _connectivity.checkConnectivity();
    if (result is ConnectivityResult) {
      _updateConnectionStatus(result);
    } else if (result is List<ConnectivityResult>) {
      _updateConnectionStatus(result.isNotEmpty ? result.first : ConnectivityResult.none);
    }
  }


  void _updateConnectionStatus(ConnectivityResult result) {
    _isConnected = result != ConnectivityResult.none;
    _connectionType = result;
    notifyListeners();
  }
}

// Note: Don't forget to add ConnectivityService() in your MultiProvider in main.dart!

// Example usage in any widget:
// final connectivity = Provider.of<ConnectivityService>(context);
// Text(connectivity.isConnected
//     ? 'Connected via ${connectivity.connectionType}'
//     : 'No Internet');
