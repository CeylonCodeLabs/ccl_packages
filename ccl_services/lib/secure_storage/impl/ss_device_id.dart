part of '../../ccl_services.dart';

class SSDeviceId extends SecureStorageHelper<String> {
  SSDeviceId(super.instance);

  @override
  String get key => 'device_id';

  @override
  String stringToValue(String value) => value;

  @override
  String valueToString(String value) => value;
}
