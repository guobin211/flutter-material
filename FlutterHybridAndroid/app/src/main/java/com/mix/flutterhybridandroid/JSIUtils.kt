package com.mix.flutterhybridandroid

import android.content.Context
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.widget.Toast

/**
 * com.mix.flutterhybridandroid
 * @author GuoBin 2020-06-28
 */
class JSIUtils(
    myWebView: MyWebView,
    mWebView: WebView,
    private val context: Context
) {

    @JavascriptInterface
    fun jsCallAndroid(string: String) {
        Toast.makeText(context, string, Toast.LENGTH_SHORT).show()
    }

}