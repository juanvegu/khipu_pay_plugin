package cl.duckytie.khipu_pay.utils

class Constants {
    companion object {
        const val KHIPU_PAY_CHANNEL = "khipu_pay_plugin"
        const val LAUNCH_KHIPU = "launch_khipu"
        const val PAYMENT_ID = "payment_id"

        // Khipu options

        const val LOCALE = "es_CL"

        // Error codes

        const val ERROR = "ERROR"
        const val INVALID_ARGUMENT = "INVALID_ARGUMENT"

        // Error messages

        const val PAYMENT_ID_REQUIRED = "Payment id is required"
        const val ERROR_GETTING_RESULT = "Error getting result"
    }
}