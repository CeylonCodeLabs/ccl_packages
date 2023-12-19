import 'package:flutter/material.dart';

extension TextColorExtension on TextStyle? {
  TextStyle? wColor(Color color) => this?.copyWith(color: color);
}
