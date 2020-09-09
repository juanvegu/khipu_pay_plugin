package cl.juanvegu.khipu_pay

import com.browser2app.khenshin.Khenshin
import com.browser2app.khenshin.KhenshinApplication
import com.browser2app.khenshin.KhenshinInterface
import io.flutter.app.FlutterApplication

class KhipuApplication: FlutterApplication(), KhenshinApplication {
    private val khenshinInterface: KhenshinInterface = Khenshin.KhenshinBuilder()
            .setApplication(this)
            .setAPIUrl("https://khipu.com/app/enc/")
            .build()

    override fun getKhenshin(): KhenshinInterface {
        return khenshinInterface
    }
}