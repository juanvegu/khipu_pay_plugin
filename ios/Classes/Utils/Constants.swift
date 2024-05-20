enum Constants {
  static let empty = ""
  
  enum Khipu {
    static let apiUrl = "https://khipu.com/app/enc/"
  }
  
  enum Channel {
    static let khipu = "khipu_pay_plugin"
  }
  
  enum Method {
    static let launchKhipu = "launch_khipu"
  }
  
  enum Key {
    static let paymentId = "payment_id"
  }
  
  enum Error {
    enum Code {
      static let failure = "FAILURE"
    }
    
    enum Message {
      static let transactionFailed = "Transaction failed"
    }
  }
  
  enum Result {
    static let ok = (result: "OK", exitMessage: "Éxito")
    static let error = (result: "ERROR", exitMessage: "Error")
    static let warning = (result: "WARNING", exitMessage: "Advertencias")
    static let continueOperation = (result: "CONTINUE", exitMessage: "Operación necesita más pasos")
  }
}
