import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_ims/configuration/app_logger.dart';

/// Predefined keys for secure storage
enum SecureStorageKeys { accessToken, refreshToken, userSecret }

class AppSecureStorage {
  static final _log = AppLogger.getLogger("AppSecureStorage");
  static final AppSecureStorage _instance = AppSecureStorage._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AppSecureStorage._internal() {
    _log.trace("Creating AppSecureStorage instance");
  }

  factory AppSecureStorage() => _instance;

  /// Save a value
  Future<bool> save(String key, String value) async {
    _log.trace("Saving data to secure storage {} {}", [key, value]);
    try {
      await _secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      _log.error("Error saving to secure storage: {}, {}", [key, e]);
      return false;
    }
  }

  /// Read a value
  Future<String?> read(String key) async {
    _log.trace("Reading data from secure storage {}", [key]);
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      _log.error("Error reading secure storage: {}, {}", [key, e]);
      return null;
    }
  }

  /// Remove a single key
  Future<bool> remove(String key) async {
    _log.trace("Removing data from secure storage {}", [key]);
    try {
      await _secureStorage.delete(key: key);
      return true;
    } catch (e) {
      _log.error("Error removing from secure storage: {}, {}", [key, e]);
      return false;
    }
  }

  /// Clear everything
  Future<void> clear() async {
    _log.info("Clearing all secure storage");
    try {
      await _secureStorage.deleteAll();
      _log.info("Cleared all secure storage");
    } catch (e) {
      _log.error("Error clearing secure storage: {}", [e]);
    }
  }
}
