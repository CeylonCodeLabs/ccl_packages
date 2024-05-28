part of '../../ccl_services.dart';

abstract class ISecureStorage<T> {
  String get key => throw UnimplementedError();

  @protected
  String valueToString(T value) => throw UnimplementedError();

  @protected
  T stringToValue(String value) => throw UnimplementedError();
}
