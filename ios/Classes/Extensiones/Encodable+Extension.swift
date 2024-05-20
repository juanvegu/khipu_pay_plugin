extension Encodable {
  func toJSONString() throws -> String {
    do {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted

      let data = try encoder.encode(self)
      guard let jsonString = String(data: data, encoding: .utf8) else {
        throw NSError()
      }

      return jsonString
    } catch {
      throw error
    }
  }
}
