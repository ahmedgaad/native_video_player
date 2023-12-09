// exoplayer.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExoPlayer extends StatefulWidget {
  final String videoUrl;

  const ExoPlayer({super.key, required this.videoUrl});

  @override
  _ExoPlayerState createState() => _ExoPlayerState();
}

class _ExoPlayerState extends State<ExoPlayer> {
  static const platform = MethodChannel('exoPlayerChannel');

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      await platform.invokeMethod('initializePlayer', {
        'url': widget.videoUrl,
      });
    } on PlatformException catch (e) {
      print("Failed to initialize player: ${e.message}");
    }
  }

  @override
  void dispose() {
    _releasePlayer();
    super.dispose();
  }

  Future<void> _releasePlayer() async {
    try {
      await platform.invokeMethod('releasePlayer');
    } on PlatformException catch (e) {
      print("Failed to release player: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Your ExoPlayer will be displayed here.'),
    );
  }
}
