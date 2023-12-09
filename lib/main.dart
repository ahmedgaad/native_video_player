import 'package:flutter/material.dart';
import 'package:flutter_native_video_player/video_player_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:VideoPlayerView(),
    );
  }
}
