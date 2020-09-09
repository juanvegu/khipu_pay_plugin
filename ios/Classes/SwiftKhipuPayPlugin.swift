import Flutter
import UIKit
import khenshin

public class SwiftKhipuPayPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftKhipuPayPlugin()
        
        let defaultChannel = FlutterMethodChannel(name: "khipu_pay", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: defaultChannel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "initialize":
                let myArguments = call.arguments as? [String : String]
                let hexaColor = myArguments?["hexaColor"] ?? "#000000"
                let color = UIColor(hexString: hexaColor)
                
                KhenshinInterface.initWithBuilderBlock {(builder: KhenshinBuilder?) -> Void in
                    builder?.apiUrl = "https://khipu.com/app/enc/"
                    builder?.mainButtonStyle = Int(KHMainButtonDefault.rawValue)
                    builder?.principalColor = color
                }
                break;
            case "paymentProcess":
                let myArguments = call.arguments as? [String : String]
                let paymentId: String? = myArguments?["paymentId"]
                
                DispatchQueue.global(qos: .userInitiated).async {
                    DispatchQueue.main.async {
                        if !paymentId!.isEmpty {
                            KhenshinInterface.startEngine(withPaymentExternalId: paymentId, userIdentifier: "", isExternalPayment: true, success: { (exitURL: URL?) in
                                result("SUCCESS")
                            }, failure: { (exitURL: URL?) in
                                result("FAILURE")
                            }, animated: false)
                        }else{
                            result("FAILURE")
                        }
                    }
                }
                break;
            default:
                result(FlutterMethodNotImplemented)
        }
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}
