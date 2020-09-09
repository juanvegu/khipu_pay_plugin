package cl.juanvegu.khipu_pay

import android.app.Activity
import android.content.Intent
import androidx.annotation.VisibleForTesting
import com.browser2app.khenshin.KhenshinApplication
import com.browser2app.khenshin.KhenshinConstants
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class MethodCallHandlerImpl(private var activity: Activity, messenger: BinaryMessenger):
        MethodChannel.MethodCallHandler, PluginRegistry.ActivityResultListener {
    companion object {
        @VisibleForTesting
        private const val START_PAYMENT_REQUEST_CODE = 1001
    }

    private var pendingResult: MethodChannel.Result? = null
    private var methodCall: MethodCall? = null

    private var methodChannel: MethodChannel = MethodChannel(messenger, "khipu_pay")

    init {
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val paymentId: String? = call.argument<String>("paymentId")

        pendingResult = result
        methodCall = call

        if(call.method == "paymentProcess"){
            val intent: Intent = (activity.application as KhenshinApplication).khenshin.startTaskIntent
            intent.putExtra(KhenshinConstants.EXTRA_PAYMENT_ID, paymentId)
            intent.putExtra(KhenshinConstants.EXTRA_FORCE_UPDATE_PAYMENT, false)
            intent.flags = Intent.FLAG_ACTIVITY_CLEAR_TOP
            activity.startActivityForResult(intent, START_PAYMENT_REQUEST_CODE)
        }else{
            result.notImplemented()
        }
    }

    fun stopListening(){
        methodChannel.setMethodCallHandler(null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if(requestCode == START_PAYMENT_REQUEST_CODE && data != null) {
            handleResult(resultCode)
        }else{
            return false
        }

        return true
    }

    private fun handleResult(resultCode: Int){
        if(resultCode == Activity.RESULT_OK){
            finishWithSuccess("SUCCESS")
        }else{
            // User cancelled payment process.
            finishWithSuccess("FAILURE")
        }
    }

    private fun finishWithSuccess(status: String){
        if(pendingResult == null){
            return
        }

        pendingResult!!.success(status)
        clearMethodCallAndResult()
    }

    private fun finishWithError(errorCode: String, errorMessage: String) {
        if (pendingResult == null) {
            return
        }
        pendingResult!!.error(errorCode, errorMessage, null)
        clearMethodCallAndResult()
    }

    private fun clearMethodCallAndResult() {
        methodCall = null
        pendingResult = null
    }
}