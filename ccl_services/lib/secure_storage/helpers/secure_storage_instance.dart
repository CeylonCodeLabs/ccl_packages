part of '../../ccl_services.dart';

abstract class SecureStorageInstance {

  @protected
  final FlutterSecureStorage defaultInstance = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    ),
  );

  @protected
  FlutterSecureStorage get instance;
}
