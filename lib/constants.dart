import 'package:flutter/services.dart';

const String kViewType = "video_player_view";
const Map<String, dynamic> kCreationParams = <String, dynamic>{
  'videoUrl': "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
};
const MethodChannel kPlatformChannel = MethodChannel('video_player_channel');
