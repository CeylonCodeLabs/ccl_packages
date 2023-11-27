import 'package:json_annotation/json_annotation.dart';

enum Flavor {
  @JsonValue(1)
  dev,
  @JsonValue(2)
  qa,
  @JsonValue(3)
  uat,
  @JsonValue(4)
  prod,
}

extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.prod:
        return 'prod';
      case Flavor.qa:
        return 'test';
      case Flavor.dev:
        return 'dev';
      case Flavor.uat:
        return 'uat';
      default:
        return 'unknown';
    }
  }

  String get appNameSuffix {
    switch (this) {
      case Flavor.prod:
        return '';
      case Flavor.qa:
        return ' | QA';
      case Flavor.dev:
        return ' | DEV';
      case Flavor.uat:
        return ' | UAT';
      default:
        return ' | Unknown';
    }
  }
}
