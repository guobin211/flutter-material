package com.mix.flutterhybridandroid

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private lateinit var flutterEngine: FlutterEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        this.cacheEngine()
        this.initBtn()
    }

    private fun cacheEngine() {
        flutterEngine = FlutterEngine(this)
        flutterEngine.navigationChannel.setInitialRoute("/")
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        // 缓存flutter
        FlutterEngineCache
            .getInstance()
            .put("my_flutter", flutterEngine)
    }

    private fun initBtn() {
        btn1.setOnClickListener {
            Log.i("flutter", "btn1 click");
            startActivity(
                FlutterActivity
                    .withCachedEngine("my_flutter")
                    .build(this)
            )
        }
        btn2.setOnClickListener {
            Log.i("flutter", "btn2 click");
            val intent: Intent = Intent(this, MyWebView::class.java)
            startActivity(intent)
        }

        btn3.setOnClickListener {
            startActivity(
                FlutterActivity.withNewEngine().initialRoute("/list").build(this)
            )
        }
    }
}