
import 'dart:async';

import 'package:flutter/services.dart';

class RotationDetector {
  static const MethodChannel _channel = MethodChannel('rotation_detector');

  static Future<bool> get rotationStatus async {
    return await _channel.invokeMethod('getRotationStatus');
  }
}
