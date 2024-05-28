part of '../ccl_services.dart';

class SecureStorageService extends SecureStorageInstance implements InitializableDependency {
  // ignore: constant_identifier_names
  static const TAG = 'SecureStorageService';

  late final SSDeviceId deviceId;
  late final SSLocale locale;

  @override
  Future<void> init() async {
    deviceId = SSDeviceId(instance);
    locale = SSLocale(instance);
  }

  Future<void> logout() async {
    final deviceId = await this.deviceId.read();
    await clearAll();
    await this.deviceId.set(deviceId);
  }

  Future<void> clearAll() => instance.deleteAll();

  @override
  FlutterSecureStorage get instance => defaultInstance;
}
