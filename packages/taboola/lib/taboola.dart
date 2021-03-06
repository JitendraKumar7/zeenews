import 'dart:async';

import 'package:flutter/services.dart';

class Taboola {
  static const MethodChannel _channel = MethodChannel('taboola');

  // call methods with name
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  // call methods with name
  static Future<bool?> get taboolaExample async {
    final bool? result = await _channel.invokeMethod('taboolaExample');
    return result;
  }
}
