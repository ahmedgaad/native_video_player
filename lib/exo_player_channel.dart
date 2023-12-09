import 'package:flutter/services.dart';

class ExoPlayerChannel {
  static const MethodChannel _channel = MethodChannel('com.example.exoplayer');

  static Future<void> initializePlayer() async {
    await _channel.invokeMethod('initializePlayer');
  }

  static Future<void> setDataSource(String uri) async {
    await _channel.invokeMethod('setDataSource', {'uri': uri});
  }

  static Future<void> play() async {
    await _channel.invokeMethod('play');
  }

  static Future<void> pause() async {
    await _channel.invokeMethod('pause');
  }
}
