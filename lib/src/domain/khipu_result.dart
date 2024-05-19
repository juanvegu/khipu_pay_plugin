import 'dart:convert';
import 'package:khipu_pay_plugin/src/domain/khipu_event.dart';

KhipuResult khipuResultFromJson(String str) => KhipuResult.fromJson(json.decode(str));

String khipuResultToJson(KhipuResult data) => json.encode(data.toJson());

class KhipuResult {
  final String operationId;
  final String exitTitle;
  final String exitMessage;
  final String? exitUrl;
  final String? continueUrl;
  final String result;
  final List<KhipuEvent> events;
  final String? failureReason;

  KhipuResult({
    this.operationId = '',
    this.exitTitle = '',
    this.exitMessage = '',
    this.exitUrl,
    this.continueUrl,
    this.result = '',
    this.events = const [],
    this.failureReason,
  });

  factory KhipuResult.fromJson(Map<String, dynamic> json) {
    return KhipuResult(
      operationId: json['operationId'] ?? '',
      exitTitle: json['exitTitle'] ?? '',
      exitMessage: json['exitMessage'] ?? '',
      exitUrl: json['exitUrl'],
      continueUrl: json['continueUrl'],
      result: json['result'] ?? '',
      events: (json['events'] as List<dynamic>?)?.map((e) => KhipuEvent.fromJson(e)).toList() ?? [],
      failureReason: json['failureReason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'operationId': operationId,
      'exitTitle': exitTitle,
      'exitMessage': exitMessage,
      'exitUrl': exitUrl,
      'continueUrl': continueUrl,
      'result': result,
      'events': events.map((e) => e.toJson()).toList(),
      'failureReason': failureReason,
    };
  }

  @override
  String toString() {
    return '{operationId: $operationId, result: $result, failureReason: $failureReason, exitTitle: $exitTitle, exitMessage: $exitMessage, exitUrl: $exitUrl, continueUrl: $continueUrl, events: $events}';
  }
}