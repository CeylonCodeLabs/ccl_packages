part of '../../ccl_services.dart';

abstract class SecureStorageHelper<T> implements ISecureStorage<T> {
  // ignore: constant_identifier_names
  static const String TAG = 'SecureStorageHelper';

  final FlutterSecureStorage _instance;

  SecureStorageHelper(this._instance);

  Future<T?> set(T? value) async {
    if (value == null) {
      await remove();
    } else {
      await _instance.write(key: key, value: valueToString(value));
    }
    return value;
  }

  Future<void> remove() => _instance.delete(key: key);

  Future<T?> read() async {
    final args = await _instance.read(key: key);
    if (args.isNotNullOrEmpty) {
      return stringToValue(args!);
    }
    return null;
  }
}
