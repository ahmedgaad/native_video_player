package com.example.flutter_native_video_player

import android.app.AlertDialog
import android.content.ContentValues
import android.content.Context
import android.net.Uri
import android.os.Build
import android.util.Log
import android.view.LayoutInflater
import android.widget.FrameLayout
import android.widget.MediaController
import android.widget.VideoView

class VideoViewPlayer(context: Context, private val videoUrl: String) : FrameLayout(context, null) {

    private var videoView: VideoView

    init {
        val inflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        val view = inflater.inflate(R.layout.sample_video_view, this)
        videoView = view.findViewById(R.id.videoView)
        val path = "android.resource://" + context.packageName.toString() + "/" + R.raw.sample
        playVideo(context,path)

        playVideo(context,path)
    }


//    private fun playVideo(context: Context) {
//        try {
//            val mediaController = MediaController(context)
//            videoView.setMediaController(mediaController)
//
//            val uri = Uri.parse(videoUrl)
//            videoView.setVideoURI(uri)
//
//            videoView.setOnPreparedListener {
//                videoView.start()
//            }
//        } catch (e: Exception) {
//            Log.e(ContentValues.TAG, "Video Play Error: ${e.message}")
//        }
//    }


    private fun playVideo(context: Context, videopath: String) {
        Log.e("Playing Video File: ", "" + videopath);
        var progressDialog : AlertDialog? = null
        try {

            val builder: AlertDialog.Builder = AlertDialog.Builder(context);
            builder.setCancelable(false);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                builder.setView(R.layout.loader)
            };
            progressDialog = builder.create();

            val mediaController = android.widget.MediaController(context)
            videoView.setMediaController(mediaController)

            videoView.setVideoURI(Uri.parse(videopath))

            videoView.setOnPreparedListener {
                progressDialog!!.dismiss();
                videoView.start()
                Log.e(ContentValues.TAG, "Video Started");
            }
        } catch (e: Exception) {
            progressDialog?.dismiss();
            Log.e(ContentValues.TAG, "Video Play Error :" + e.localizedMessage);
        }
    }
}