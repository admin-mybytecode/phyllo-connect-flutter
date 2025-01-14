import 'dart:async';

import 'package:flutter/services.dart';
import 'src/enum.dart';
import 'src/phyllo_config.dart';

export 'src/enum.dart';
export 'src/phyllo_config.dart';

class PhylloConnect {
  PhylloConnect._();

  static const MethodChannel _channel = MethodChannel('phyllo_connect');

  /// Get [Environment] baseUrl on [PhylloEnvironment] type
  ///
  static Future<String?> getPhylloEnvironmentUrl(
      PhylloEnvironment environment) async {
    Map<String, dynamic> args = {'type': environment.name};
    final String? envUrl =
        await _channel.invokeMethod('getPhylloEnvironmentUrl', args);
    return envUrl;
  }

  /// Initialize [PhylloConnect] SDK with [PhylloConfig] arguments
  /// 
  static Future<void> initialize(PhylloConfig config) async {
    await _channel.invokeMethod('initialize', config.toArgs());
  }

  /// Open [PhylloConnect] SDK
  /// 
  static Future<void> open() async {
    await _channel.invokeMethod('open');
  }
}
