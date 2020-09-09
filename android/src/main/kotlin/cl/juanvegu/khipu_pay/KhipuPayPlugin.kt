package cl.juanvegu.khipu_pay

import android.app.Activity
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.PluginRegistry.Registrar

/** KhipuPayPlugin */
class KhipuPayPlugin: FlutterPlugin, ActivityAware {
  private var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null
  private var methodCallHandler: MethodCallHandlerImpl? = null

  private var binding: ActivityPluginBinding? = null

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects.
  companion object {
    private var registrar: Registrar? = null

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      this.registrar = registrar
      KhipuPayPlugin().maybeStartListening(registrar.activity(), registrar.messenger())
    }
  }

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    this.flutterPluginBinding = binding
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    this.flutterPluginBinding = null
  }

  // ActivityAware
  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.binding = binding
    maybeStartListening(binding.activity, flutterPluginBinding!!.binaryMessenger)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun onDetachedFromActivity() {
    if(methodCallHandler == null) return

    methodCallHandler!!.stopListening()
    methodCallHandler = null
  }

  // Initialize MethodCallHandler
  private fun maybeStartListening(activity: Activity, messenger: BinaryMessenger){
    methodCallHandler = MethodCallHandlerImpl(activity, messenger)

    if(registrar != null){
      registrar!!.addActivityResultListener(methodCallHandler)
    }else{
      binding!!.addActivityResultListener(methodCallHandler!!)
    }
  }
}
