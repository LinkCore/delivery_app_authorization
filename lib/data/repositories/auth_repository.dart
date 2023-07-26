import 'dart:convert';

import 'package:authorization/common/app_settings/app_secrets.dart';
import 'package:authorization/data/repositories/auth_constants.dart';
import 'package:authorization/data/user/profile/profile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static final AuthRepository _userRepository = AuthRepository._internal();

  factory AuthRepository() {
    return _userRepository;
  }

  AuthRepository._internal();

  Future<Profile> signIn({
    required String email,
    required String password,
  }) async {
    http.Response response = await http.post(
      Uri.parse('${AppSecrets.apiAddress}${AuthConstants.loginEndpoint}'),
      body: {
        AuthConstants.emailKey: email,
        AuthConstants.passwordKey: password
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      await _saveToLocalDb(email: email, password: password);
      return Profile.fromJson(map);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Profile> allowAutoLogin() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    final password =
        await secureStorage.read(key: AuthConstants.storagePasswordKey);
    final email = await secureStorage.read(key: AuthConstants.storageEmailKey);
    if (email == null || password == null) {
      throw Exception('no data stored locally');
    }
    Profile profile = await signIn(email: email, password: password);
    if (email == profile.user.email) {
      return profile;
    } else {
      throw Exception('data from the server does not match');
    }
  }

  Future<void> signOut() async {
    await _clearLocalDb();
  }

  Future<void> _saveToLocalDb({
    required String email,
    required String password,
  }) async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.write(key: AuthConstants.storageEmailKey, value: email);
    await secureStorage.write(
        key: AuthConstants.storagePasswordKey, value: password);
  }

  Future<void> _clearLocalDb() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.delete(key: AuthConstants.storageEmailKey);
    await secureStorage.delete(key: AuthConstants.storagePasswordKey);
  }
}
