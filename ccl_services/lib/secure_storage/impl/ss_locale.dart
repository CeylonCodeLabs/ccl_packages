part of '../../ccl_services.dart';

class SSLocale extends SecureStorageHelper<String> {
  SSLocale(super.instance);

  @override
  String get key => 'locale';

  @override
  String stringToValue(String value) => value;

  @override
  String valueToString(String value) => value;
}
