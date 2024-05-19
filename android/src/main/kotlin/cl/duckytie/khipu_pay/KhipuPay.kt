package cl.duckytie.khipu_pay

import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger

/** KhipuPayPlugin */
class KhipuPay: FlutterPlugin, ActivityAware {
  private var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null
  private var methodCallHandler: KhipuPayHandler? = null

  private var binding: ActivityPluginBinding? = null

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    flutterPluginBinding = binding
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    flutterPluginBinding = null
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.binding = binding
    maybeStartListening(binding.activity, flutterPluginBinding!!.binaryMessenger)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivity() {
    if(methodCallHandler == null) return

    methodCallHandler!!.stopListening()
    methodCallHandler = null
  }

  private fun maybeStartListening(activity: Activity, messenger: BinaryMessenger){
    methodCallHandler = KhipuPayHandler(activity, messenger)
    binding!!.addActivityResultListener(methodCallHandler!!)
  }
}
