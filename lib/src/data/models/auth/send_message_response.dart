import 'package:flutter/foundation.dart';

@immutable
class SendMessageResponse {
  final String? status;
  final String? description;
  final Map<String, dynamic>? data;

  const SendMessageResponse({
    this.status,
    this.description,
    this.data,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      status: json['message'],
      description: json['error'],
      data: json['data'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SendMessageResponse &&
        other.status == status &&
        other.description == description &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ description.hashCode ^ data.hashCode;
}
