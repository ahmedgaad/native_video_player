import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  void initState() {
    super.initState();
    kCreationParams['url'] =
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4";
  }

  @override
  Widget build(BuildContext context) {
    return const AndroidView(
      viewType: kViewType,
      layoutDirection: TextDirection.ltr,
      creationParams: kCreationParams,
      creationParamsCodec: StandardMessageCodec(),
    );

    // Scaffold(
    //   body: PlatformViewLink(
    //     surfaceFactory: (context, controller) {
    //       return AndroidViewSurface(
    //         controller: controller as AndroidViewController,
    //         hitTestBehavior: PlatformViewHitTestBehavior.opaque,
    //         gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
    //       );
    //     },
    //     onCreatePlatformView: (PlatformViewCreationParams params) {
    //       return PlatformViewsService.initAndroidView(
    //         id: params.id,
    //         viewType: kViewType,
    //         layoutDirection: TextDirection.ltr,
    //         creationParams: kCreationParams,
    //         creationParamsCodec: const StandardMessageCodec(),
    //         onFocus: () {
    //           params.onFocusChanged(true);
    //         },
    //       )
    //         ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
    //         ..create();
    //     },
    //     viewType: kViewType,
    //   ),
    // );
  }
}
