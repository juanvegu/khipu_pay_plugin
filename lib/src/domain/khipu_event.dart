class KhipuEvent {
  final String name;
  final String timestamp;
  final String type;

  KhipuEvent({
    this.name = '',
    this.timestamp = '',
    this.type = '',
  });

  factory KhipuEvent.fromJson(Map<String, dynamic> json) {
    return KhipuEvent(
      name: json['name'] ?? '',
      timestamp: json['timestamp'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'timestamp': timestamp,
      'type': type,
    };
  }

  @override
  String toString() {
    return '{name: $name, timestamp: $timestamp, type: $type}';
  }
}