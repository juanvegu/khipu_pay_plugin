struct KhipuResult: Codable {
  let operationId: String
  let exitTitle: String
  let exitMessage: String
  let exitUrl: String?
  let continueUrl: String?
  let result: String
  let events: [KhipuEvent]
  let failureReason: String?

  init(
    operationId: String = "", 
    exitTitle: String = "", 
    exitMessage: String = "", 
    exitUrl: String? = nil, 
    continueUrl: String? = nil, 
    result: String = "", 
    events: [KhipuEvent] = [], 
    failureReason: String? = nil
  ) {
    self.operationId = operationId
    self.exitTitle = exitTitle
    self.exitMessage = exitMessage
    self.exitUrl = exitUrl
    self.continueUrl = continueUrl
    self.result = result
    self.events = events
    self.failureReason = failureReason
  }
}