package cl.duckytie.khipu_pay

import android.app.Activity
import android.app.Activity.RESULT_OK
import android.content.Intent
import cl.duckytie.khipu_pay.utils.Constants
import com.khipu.client.KHIPU_RESULT_EXTRA
import com.khipu.client.KhipuOptions
import com.khipu.client.KhipuResult
import com.khipu.client.getKhipuLauncherIntent
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class KhipuPayHandler(
    private var activity: Activity,
    messenger: BinaryMessenger
): MethodChannel.MethodCallHandler, PluginRegistry.ActivityResultListener {
    private var methodChannel: MethodChannel = MethodChannel(messenger, Constants.KHIPU_PAY_CHANNEL)

    companion object {
        const val PAYMENT_REQUEST_CODE = 1001
    }

    private var pendingResult: MethodChannel.Result? = null
    private var methodCall: MethodCall? = null

    init {
        methodChannel.setMethodCallHandler(this)
    }
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        pendingResult = result
        methodCall = call

        if (call.method == Constants.LAUNCH_KHIPU) {
            val paymentId: String? = call.argument<String>(Constants.PAYMENT_ID)

            if (paymentId.isNullOrEmpty()) {
                pendingResult!!.error(Constants.INVALID_ARGUMENT, Constants.PAYMENT_ID_REQUIRED, null)
                return
            }

            val intent = getKhipuLauncherIntent(
                context = activity,
                operationId = paymentId,
                options = KhipuOptions.Builder()
                    .locale(Constants.LOCALE)
                    .build()
            )
            activity.startActivityForResult(intent, PAYMENT_REQUEST_CODE)
        } else {
            result.notImplemented()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == PAYMENT_REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                val metadata = data?.getSerializableExtra(KHIPU_RESULT_EXTRA) as? KhipuResult

                if (metadata == null) {
                    pendingResult!!.error(Constants.ERROR, Constants.ERROR_GETTING_RESULT, null)
                }

                val resultText = metadata!!.asJson()
                finishProcessWith(resultText)
            }

            return true
        } else {
            return false
        }
    }

    private fun finishProcessWith(resultText: String) {
        if (pendingResult == null) {
            return
        }

        pendingResult!!.success(resultText)
        clearMethodCallAndResult()
    }

    private fun clearMethodCallAndResult() {
        methodCall = null
        pendingResult = null
    }

    fun stopListening(){
        methodChannel.setMethodCallHandler(null)
    }
}