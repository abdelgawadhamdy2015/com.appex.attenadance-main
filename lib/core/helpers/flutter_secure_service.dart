import 'package:biometric_storage/biometric_storage.dart';

class BiometricStorageService {
  // Get the BiometricStorage storage instance
  Future<BiometricStorageFile?> _getStorage() async {
    try {
      final canAuthenticate = await BiometricStorage().canAuthenticate();
      if (canAuthenticate == CanAuthenticateResponse.success) {
        return BiometricStorage().getStorage('auth_token', 
            options: StorageFileInitOptions(authenticationRequired: true));
      } else {
        print('Biometric authentication not available.');
        return null;
      }
    } catch (e) {
      print('Error initializing storage: $e');
      return null;
    }
  }

  // Store a token securely
  Future<void> storeToken(String token) async {
    final storage = await _getStorage();
    if (storage != null) {
      try {
        await storage.write(token);
        print('Token stored successfully');
      } catch (e) {
        print('Error storing token: $e');
      }
    }
  }

  // Retrieve the stored token
  Future<String?> getToken() async {
    final storage = await _getStorage();
    if (storage != null) {
      try {
        String? token = await storage.read();
        return token;
      } catch (e) {
        print('Error retrieving token: $e');
        return null;
      }
    }
    return null;
  }

  // Delete the stored token
  Future<void> deleteToken() async {
    final storage = await _getStorage();
    if (storage != null) {
      try {
        await storage.delete();
        print('Token deleted successfully');
      } catch (e) {
        print('Error deleting token: $e');
      }
    }
  }
}
