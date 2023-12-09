package com.example.flutter_native_video_player

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val arguments = args as? Map<String, String> ?: emptyMap()
        val videoUrl = arguments["videoUrl"] ?: "default_video_url"
        return NativeView(context, videoUrl)
    }
}