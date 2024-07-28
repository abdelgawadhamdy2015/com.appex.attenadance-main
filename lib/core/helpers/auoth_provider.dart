import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';

// Create a class to handle authentication state and token storage
class AuthProvider with ChangeNotifier {
  String? _token;
  final _storage = const FlutterSecureStorage();

  // Getter for token
  String? get token => _token;

  // Method to set token
  Future<void> setToken(String token) async {
    _token = token;
    // Save token securely
    await _storage.write(key: myToken, value: token);
    notifyListeners();
  }

  // Method to fetch token
  Future<void> fetchToken() async {
    _token = await _storage.read(key: myToken);
    notifyListeners();
  }

  // Method to clear token (logout)
  Future<void> clearToken() async {
    _token = null;
    await _storage.delete(key: myToken);
    notifyListeners();
  }
}