struct KhipuEvent: Codable {
  let name: String
  let timestamp: String
  let type: String

  init(
    name: String = "",
    timestamp: String = "",
    type: String = ""
  ) {
    self.name = name
    self.timestamp = timestamp
    self.type = type
  }
}
