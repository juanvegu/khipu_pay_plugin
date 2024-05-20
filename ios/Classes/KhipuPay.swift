import Flutter
import UIKit
import khenshin

public class KhipuPay: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: Constants.Channel.khipu,
      binaryMessenger: registrar.messenger()
    )
    let instance = KhipuPay()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case Constants.Method.launchKhipu:
      KhenshinInterface.initWithBuilderBlock {(builder: KhenshinBuilder?) -> Void in
        builder?.apiUrl = Constants.Khipu.apiUrl
        builder?.mainButtonStyle = Int(KHMainButtonDefault.rawValue)
      }
      
      guard let arguments = call.arguments as? [String : String],
            let paymentId = arguments[Constants.Key.paymentId] else {
        return
      }
      
      KhenshinInterface.startEngine(
        withPaymentExternalId: paymentId,
        userIdentifier: Constants.empty,
        isExternalPayment: true,
        success: { [weak self] (exitURL: URL?) in
          self?.successProcess(paymentId: paymentId, exitURL: exitURL, result: result)
        },
        failure: { [weak self] (exitURL: URL?) in
          self?.failureProcess(paymentId: paymentId, exitURL: exitURL, result: result)
        },
        animated: true
      )
    default:
      result(FlutterMethodNotImplemented)
    }
  }
  
  private func successProcess(paymentId: String, exitURL: URL?, result: @escaping FlutterResult) {
    let khipuResult = KhipuResult(
      operationId: paymentId,
      exitMessage: Constants.Result.ok.result,
      exitUrl: exitURL?.absoluteString,
      result: Constants.Result.ok.result
    )
    
    do {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted
      let data = try encoder.encode(khipuResult)
      let resultText = String(data: data, encoding: .utf8)
      result(resultText)
    } catch {
      result(
        FlutterError(
          code: Constants.Error.Code.failure,
          message: Constants.Error.Message.transactionFailed,
          details: nil)
      )
    }
  }
  
  private func failureProcess(paymentId: String, exitURL: URL?, result: @escaping FlutterResult) {
    result(
      FlutterError(
        code: Constants.Error.Code.failure,
        message: Constants.Error.Message.transactionFailed,
        details: nil)
    )
  }
}
