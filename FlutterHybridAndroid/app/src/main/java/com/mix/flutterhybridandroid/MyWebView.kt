package com.mix.flutterhybridandroid

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.webkit.WebChromeClient
import android.webkit.WebView
import android.webkit.WebViewClient
import kotlinx.android.synthetic.main.activity_my_web_view.*

class MyWebView : AppCompatActivity() {
    // 延迟加载
    private val mWebView: WebView by lazy {
        m_web_view
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_my_web_view)
        setWebView()
    }


    @SuppressLint("SetJavaScriptEnabled")
    private fun setWebView() {
        mWebView.settings.javaScriptEnabled = true
        mWebView.webChromeClient = MyWebChromeClient()
        mWebView.webViewClient = MyWebViewClient()
        mWebView.addJavascriptInterface(JSIUtils(this, mWebView, baseContext), "JSIUtils")
        mWebView.loadUrl("file:///android_asset/assets/index.html")
    }

    private fun callJS(fnName: String, args: String) {
        mWebView.loadUrl("javascript:$fnName($args)")
    }

    inner class MyWebChromeClient : WebChromeClient() {
        // 加载网页的时候，进度变化
        override fun onProgressChanged(view: WebView?, newProgress: Int) {
            super.onProgressChanged(view, newProgress)
        }
    }

    inner class MyWebViewClient : WebViewClient() {
        // 网页加载完成之后，调用这个方法
        override fun onPageFinished(view: WebView?, url: String?) {
            super.onPageFinished(view, url)
        }
    }
}