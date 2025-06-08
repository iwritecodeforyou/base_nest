import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;

  LocalStorageService._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    await _prefs?.setString('user_token', token);
  }

  String? getToken() {
    return _prefs?.getString('user_token');
  }

  Future<void> clearToken() async {
    await _prefs?.remove('user_token');
  }
}