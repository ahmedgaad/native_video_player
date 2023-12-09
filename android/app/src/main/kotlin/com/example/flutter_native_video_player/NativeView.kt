package com.example.flutter_native_video_player

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context?, private val videoUrl: String) : PlatformView {
    private var view: VideoViewPlayer? = context?.let { VideoViewPlayer(it, videoUrl) }

    override fun getView(): View? {
        return view
    }

    override fun dispose() {
        view = null
    }
}
